import 'package:async_value_group/async_value_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/model/group_match_result.dart';
import 'package:jong_connect/domain/model/input_user_score.dart';
import 'package:jong_connect/domain/provider/group_match.dart';
import 'package:jong_connect/domain/provider/group_match_players.dart';
import 'package:jong_connect/domain/provider/group_match_round_results.dart';
import 'package:jong_connect/presentation/common_widgets/user_section_item_vertical.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:jong_connect/util/exceptions/calc_match_results_exception.dart';
import 'package:jong_connect/util/expect.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../domain/model/app_user.dart';
import '../../../domain/provider/game_config.dart';
import '../../../usecase/group_match_results_use_case.dart';
import '../../../util/input_seating_order_form.dart';

class EditGroupMatchScorePage extends ConsumerStatefulWidget {
  const EditGroupMatchScorePage(
      {super.key,
      required this.groupId,
      required this.groupMatchId,
      required this.matchOrder});

  final int groupId;
  final int groupMatchId;
  final int matchOrder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputScoreFormState();
}

class _InputScoreFormState extends ConsumerState<EditGroupMatchScorePage> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormBuilderState>();
  List<AppUser>? targetPlayers;

  Future<void> register(
      MatchType type, List<GroupMatchResult> originResults) async {
    if (!_formKey.currentState!.saveAndValidate()) {
      _btnController.reset();
      return;
    }

    try {
      int blankCount = 0;
      var gameConfig = await ref.read(gameConfigProvider.future);
      int maxTotalScore =
          gameConfig!.initialStartingPoint * type.playableNumber;
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

      // 同点のプレイヤーがいる場合ここで別画面表示して座順を入力してもらう
      var nonDuplicateScores =
          inputScores.map<int>((input) => input.score).toSet().toList();
      if (nonDuplicateScores.length < inputScores.length) {
        if (!mounted) {
          return;
        }
        List<int>? seatingOrders = await showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text("座順を起家から順に選択してください"),
              content: InputSeatingOrderForm(
                players: targetPlayers!,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text('キャンセル'),
                ),
              ],
            );
          },
        );

        if (seatingOrders == null) {
          return;
        }
        for (var i = 0; i < inputScores.length; i++) {
          inputScores[i] =
              inputScores[i].copyWith(seatingOrder: seatingOrders[i]);
        }
      }

      await ref.read(groupMatchResultsUseCaseProvider).editRoundResults(
          widget.matchOrder, type, originResults, inputScores);

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('スコア編集'),
      ),
      body: AsyncValueGroup.group3(
        ref.watch(groupMatchProvider(groupMatchId: widget.groupMatchId)),
        ref.watch(groupMatchRoundResultsProvider(
            groupMatchId: widget.groupMatchId, matchOrder: widget.matchOrder)),
        ref.watch(groupMatchPlayersProvider(widget.groupId)),
      ).when(
        data: (values) {
          targetPlayers ??=
              values.$2.map<AppUser>((result) => result.user!).toList();
          var allPlayers = [...values.$1.joinUsers, ...values.$3];
          allPlayers = expect(allPlayers, (player) => player.id);

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
                    maxChips: values.$1.matchType.playableNumber,
                    validator: (selectors) {
                      var diff = (selectors?.length ?? 0) -
                          values.$1.matchType.playableNumber;
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
                      for (var player in values.$1.joinUsers) ...[
                        FormBuilderChipOption(
                          value: player,
                          child: UserSectionItemVertical(user: player),
                        ),
                      ],
                    ],
                  ),
                ),
                gapH16,
                for (var i = 0;
                    i < values.$1.matchType.playableNumber;
                    i++) ...[
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
                          initialValue: values.$2[i].score.toString(),
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
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  successIcon: Icons.check,
                  failedIcon: Icons.cottage,
                  controller: _btnController,
                  onPressed: () => register(values.$1.matchType, values.$2),
                  child: Text(
                    '保存',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, st) {
          print(st);
          return const Center(
              child: Text('Oops, something unexpected happened'));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
