import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/model/input_user_score.dart';
import 'package:jong_connect/presentation/common_widgets/user_section_item_vertical.dart';
import 'package:jong_connect/usecase/group_match_results_use_case.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:jong_connect/util/exceptions/calc_match_results_exception.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../domain/model/app_user.dart';
import '../../../domain/provider/group_match_players.dart';
import '../../common_widgets/async_value_widget.dart';

class EditGroupMatchScorePage extends ConsumerStatefulWidget {
  const EditGroupMatchScorePage(
      {super.key,
      required this.groupId,
      required this.type,
      required this.matchOrder});

  final int groupId;
  final MatchType type;
  final int matchOrder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputScoreFormState();
}

class _InputScoreFormState extends ConsumerState<EditGroupMatchScorePage> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormBuilderState>();
  List<AppUser>? targetPlayers;

  Future<void> register() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      _btnController.reset();
      return;
    }

    try {
      int blankCount = 0;
      // TODO: ウマオカ設定時はここも変更する
      int maxTotalScore = 100000;
      int totalScore = 0;
      for (var i = 0; i < targetPlayers!.length; i++) {
        if (_formKey.currentState!.value["player$i"] == null ||
            _formKey.currentState!.value["player$i"].toString().isEmpty) {
          blankCount++;
          // 2人以上入力していない場合エラー
          if (blankCount >= 2) {
            throw const CalcMatchResultsException('スコアを入力してください');
          }
        } else {
          totalScore += int.parse(_formKey.currentState!.value["player$i"]);
        }
      }

      // 一人入力していない場合はここで自動保管する
      var inputScores = <InputUserScore>[];
      for (var i = 0; i < targetPlayers!.length; i++) {
        if (_formKey.currentState!.value["player$i"] == null ||
            _formKey.currentState!.value["player$i"].toString().isEmpty) {
          var score = maxTotalScore - totalScore;
          totalScore += score;
          inputScores.add(
            InputUserScore(user: targetPlayers![i], score: score),
          );
        } else {
          inputScores.add(InputUserScore(
            user: targetPlayers![i],
            score: int.parse(_formKey.currentState!.value["player$i"]),
          ));
        }
      }

      // 4人の合計値の整合性チェック
      if (totalScore != maxTotalScore) {
        throw const CalcMatchResultsException('合計値が合うようにスコアを入力してください');
      }

      // TODO: 同点のプレイヤーがいる場合ここで別画面表示して座順を入力してもらう
      ref
          .read(createGroupMatchResultsUseCaseProvider(
                  widget.groupId, widget.type.name)
              .notifier)
          .editRoundResults(widget.matchOrder, inputScores);

      context.pop();
      SnackBarService.showSnackBar(content: 'スコアを編集しました');
    } on CalcMatchResultsException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: unexpectedErrorMessage);
    } finally {
      _btnController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final groupMatchResults = ref.watch(createGroupMatchResultsUseCaseProvider(
        widget.groupId, widget.type.name));
    final targetOrderScores = groupMatchResults.results
        .where((result) => result.matchOrder == widget.matchOrder)
        .map<InputUserScore>(
            (result) => InputUserScore(user: result.user!, score: result.score))
        .toList();
    targetPlayers =
        targetOrderScores.map<AppUser>((score) => score.user).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('スコア編集'),
      ),
      body: AsyncValueWidget(
        asyncValue: ref.read(groupMatchPlayersProvider(widget.groupId)),
        data: (players) {
          return FormBuilder(
            key: _formKey,
            child: ListView(
              padding: formPadding,
              children: [
                SizedBox(
                  height: 100,
                  child: FormBuilderFilterChip(
                    name: 'player',
                    decoration: const InputDecoration(labelText: '参加者'),
                    initialValue: targetPlayers,
                    maxChips: widget.type.playableNumber,
                    validator: (selectors) {
                      var diff =
                          (selectors?.length ?? 0) - widget.type.playableNumber;
                      if (diff == 0) {
                        return null;
                      }

                      return '参加者を選択してください';
                    },
                    onChanged: (users) => setState(() {
                      targetPlayers = users ?? [];
                    }),
                    showCheckmark: false,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    options: [
                      for (var player in players) ...[
                        FormBuilderChipOption(
                          value: player,
                          child: UserSectionItemVertical(user: player),
                        ),
                      ],
                    ],
                  ),
                ),
                gapH16,
                for (var i = 0; i < widget.type.playableNumber; i++) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: deviceSize.width / 3,
                        child: Text(
                          targetPlayers!.length <= i
                              ? ''
                              : targetPlayers![i].name,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      gapW12,
                      SizedBox(
                        width: deviceSize.width / 2.5,
                        child: FormBuilderTextField(
                          name: "player$i",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          initialValue: targetOrderScores[i].score.toString(),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.numeric(
                                checkNullOrEmpty: false),
                          ]),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ],
                gapH24,
                RoundedLoadingButton(
                  successIcon: Icons.check,
                  failedIcon: Icons.cottage,
                  controller: _btnController,
                  onPressed: register,
                  child:
                      const Text('保存', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
