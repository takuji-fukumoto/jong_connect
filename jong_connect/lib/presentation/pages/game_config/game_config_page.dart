import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/provider/game_config.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/usecase/edit_game_config_use_case.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class GameConfigPage extends ConsumerStatefulWidget {
  const GameConfigPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditConfigFormState();
}

class _EditConfigFormState extends ConsumerState<GameConfigPage> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> applyConfig() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      _btnController.reset();
      return;
    }

    try {
      // string -> list<int>に変換
      final positionPoints =
          _formKey.currentState!.value["position_points"]!.toString();
      final fixedPositionPoints = positionPoints
          .split(',')
          .map<int>((point) => int.parse(point))
          .toList();

      await ref.read(editGameConfigUseCaseProvider).apply(
            initialStartingPoint: int.parse(
                _formKey.currentState!.value["initial_starting_point"]),
            settlementScore:
                int.parse(_formKey.currentState!.value["settlement_score"]),
            positionPoints: fixedPositionPoints,
          );
      _btnController.success();
      context.pop();

      SnackBarService.showSnackBar(content: 'ゲーム設定を変更しました');
    } catch (error) {
      SnackBarService.showSnackBar(content: 'ゲーム設定の更新に失敗しました。時間を空けて再度お試しください');
    } finally {
      _btnController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ゲーム設定'),
      ),
      body: AsyncValueWidget(
        asyncValue: ref.watch(gameConfigProvider),
        data: (config) {
          if (config == null) {
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.grey,
                size: 50,
              ),
            );
          }

          return FormBuilder(
            key: _formKey,
            child: ListView(
              padding: formPadding,
              children: [
                FormBuilderTextField(
                  name: "initial_starting_point",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: config.initialStartingPoint.toString(),
                  decoration: const InputDecoration(labelText: '配給原点'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                  ]),
                ),
                gapH16,
                FormBuilderTextField(
                  name: "settlement_score",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: config.settlementScore.toString(),
                  decoration: const InputDecoration(labelText: '原点'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                  ]),
                ),
                gapH16,
                FormBuilderDropdown(
                  name: "position_points",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: config.positionPointsString,
                  decoration: const InputDecoration(labelText: 'ウマ'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  items: const [
                    DropdownMenuItem(
                      value: '0,0,0,0',
                      child: Text('無し'),
                    ),
                    DropdownMenuItem(
                      value: '10,5,-5,-10',
                      child: Text('10, 5, -5, -10'),
                    ),
                    DropdownMenuItem(
                      value: '20,10,-10,-20',
                      child: Text('20, 10, -10, -20'),
                    ),
                    DropdownMenuItem(
                      value: '30,10,-10,-30',
                      child: Text('30, 10, -10, -30'),
                    ),
                  ],
                ),
                gapH16,
                RoundedLoadingButton(
                  successIcon: Icons.check,
                  failedIcon: Icons.cottage,
                  controller: _btnController,
                  onPressed: applyConfig,
                  child:
                      const Text('反映', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
