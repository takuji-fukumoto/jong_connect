import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:jong_connect/presentation/common_widgets/number_counter_keyboard.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../../domain/model/group_match.dart';
import '../../../util/score_color.dart';

class CheckSettlementForm extends StatefulWidget {
  const CheckSettlementForm({super.key, required this.match});

  final GroupMatch match;

  @override
  State<CheckSettlementForm> createState() => _CheckSettlementFormState();
}

class _CheckSettlementFormState extends State<CheckSettlementForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  int rate = 0;
  int chipRate = 0;
  late final List<FocusNode> textNodes;
  late final List<ValueNotifier<String>> stringNotifier;

  // ユーザーID -> チップ数
  Map<String, int> userChips = {};

  @override
  void initState() {
    super.initState();
    textNodes =
        List.generate(widget.match.joinUsers.length, (index) => FocusNode());
    stringNotifier = List.generate(
        widget.match.joinUsers.length, (index) => ValueNotifier<String>('0'));

    for (var player in widget.match.joinUsers) {
      userChips[player.id] = 0;
    }
  }

  int _settlementScore(String userId) {
    var score = widget.match.totalPointsPerUser[userId] ?? 0;
    var chips = userChips[userId] ?? 0;

    return (score * rate) + (chips * chipRate);
  }

  @override
  Widget build(BuildContext context) {
    final players = widget.match.joinUsers;
    return KeyboardActions(
      config: _keyboardActionConfig(widget.match.joinUsers.length),
      isDialog: true,
      child: Column(
        children: [
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: "rate",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: '0',
                  decoration: const InputDecoration(labelText: 'レート（1000点あたり）'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                  ]),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    var input = int.tryParse(value ?? '');
                    if (input == null) {
                      return;
                    }
                    setState(() {
                      rate = input;
                    });
                  },
                ),
                gapH16,
                FormBuilderTextField(
                  name: "chip_rate",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: '0',
                  decoration:
                      const InputDecoration(labelText: 'チップのレート（1枚あたり）'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                  ]),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    var input = int.tryParse(value ?? '');
                    if (input == null) {
                      return;
                    }
                    setState(() {
                      chipRate = input;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            height: 300,
            child: DataTable2(
              columnSpacing: Sizes.p8,
              horizontalMargin: Sizes.p8,
              fixedLeftColumns: 1,
              isVerticalScrollBarVisible: true,
              columns: const [
                DataColumn2(
                  label: Center(
                    child: AutoSizeText(
                      '参加者',
                      minFontSize: Sizes.p8,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                DataColumn2(
                  label: Center(
                    child: AutoSizeText(
                      '対局\nポイント',
                      minFontSize: Sizes.p8,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataColumn2(
                  label: Center(
                    child: AutoSizeText(
                      'チップ\n収支',
                      minFontSize: Sizes.p8,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataColumn2(
                  label: Center(
                    child: AutoSizeText(
                      '合計\n収支',
                      minFontSize: Sizes.p8,
                    ),
                  ),
                ),
              ],
              rows: [
                for (var i = 0; i < players.length; i++) ...[
                  DataRow2(
                    cells: [
                      DataCell(
                        Center(
                          child: AutoSizeText(
                            players[i].name,
                            minFontSize: Sizes.p8,
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            widget.match.totalPointsPerUser[players[i].id] !=
                                    null
                                ? widget.match.totalPointsPerUser[players[i].id]
                                    .toString()
                                : '0',
                            style: TextStyle(
                                fontSize: 16,
                                color: scoreColor(
                                    context,
                                    widget.match
                                        .totalPointsPerUser[players[i].id])),
                          ),
                        ),
                      ),
                      DataCell(
                        KeyboardCustomInput<String>(
                          focusNode: textNodes[i],
                          notifier: stringNotifier[i],
                          builder: (context, number, hasFocus) {
                            print('number: $number');
                            print('notifier: ${stringNotifier[i].value}');
                            if (stringNotifier[i].value != number) {
                              setState(() {
                                userChips[players[i].id] = int.parse(number);
                              });
                            }
                            // WidgetsBinding.instance
                            //     .addPostFrameCallback((timeStamp) {
                            //   setState(() {
                            //     userChips[players[i].id] = int.parse(number);
                            //   });
                            // });
                            // if (hasFocus != null && hasFocus) {
                            //   setState(() {
                            //     userChips[players[i].id] = int.parse(number);
                            //   });
                            // }

                            return Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: (hasFocus != null && hasFocus)
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .inverseSurface,
                                    width: (hasFocus != null && hasFocus)
                                        ? 2.0
                                        : 0.7,
                                  ),
                                ),
                              ),
                              child: Text(
                                number.toString(),
                              ),
                            );
                          },
                        ),
                        // FormBuilderTextField(
                        //   name: "chips-${player.id}",
                        //   autovalidateMode: AutovalidateMode.onUserInteraction,
                        //   initialValue: '0',
                        //   textAlign: TextAlign.center,
                        //   validator: FormBuilderValidators.compose([
                        //     FormBuilderValidators.required(),
                        //     FormBuilderValidators.numeric(),
                        //   ]),
                        //   keyboardType: TextInputType.datetime,
                        //   onChanged: (value) {
                        //     var input = int.tryParse(value ?? '');
                        //     if (input == null) {
                        //       return;
                        //     }
                        //     setState(() {
                        //       userChips[player.id] = input;
                        //     });
                        //   },
                        // ),
                      ),
                      DataCell(
                        Center(
                          child: AutoSizeText(
                            _settlementScore(players[i].id).toString(),
                            minFontSize: Sizes.p8,
                            style: TextStyle(
                              color: scoreColor(
                                  context, _settlementScore(players[i].id)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  KeyboardActionsConfig _keyboardActionConfig(int playableNumber) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      nextFocus: true,
      actions: [
        for (var i = 0; i < playableNumber; i++) ...[
          KeyboardActionsItem(
            focusNode: textNodes[i],
            footerBuilder: (_) =>
                NumberCounterKeyboard(notifier: stringNotifier[i]),
          ),
        ],
      ],
    );
  }
}
