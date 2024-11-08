import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:jong_connect/util/app_sizes.dart';

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

  // ユーザーID -> チップ数
  Map<String, int> userChips = {};

  @override
  void initState() {
    super.initState();
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
    return Column(
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
                decoration: const InputDecoration(labelText: 'チップのレート（1枚あたり）'),
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
              for (var player in widget.match.joinUsers) ...[
                DataRow2(
                  cells: [
                    DataCell(
                      Center(
                        child: AutoSizeText(
                          player.name,
                          minFontSize: Sizes.p8,
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          widget.match.totalPointsPerUser[player.id] != null
                              ? widget.match.totalPointsPerUser[player.id]
                                  .toString()
                              : '0',
                          style: TextStyle(
                              fontSize: 16,
                              color: scoreColor(context,
                                  widget.match.totalPointsPerUser[player.id])),
                        ),
                      ),
                    ),
                    DataCell(
                      FormBuilderTextField(
                        name: "chips-${player.id}",
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        initialValue: '0',
                        textAlign: TextAlign.center,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          var input = int.tryParse(value ?? '');
                          if (input == null) {
                            return;
                          }
                          setState(() {
                            userChips[player.id] = input;
                          });
                        },
                      ),
                    ),
                    DataCell(
                      Center(
                        child: AutoSizeText(
                          _settlementScore(player.id).toString(),
                          minFontSize: Sizes.p8,
                          style: TextStyle(
                            color: scoreColor(
                                context, _settlementScore(player.id)),
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
    );
  }
}
