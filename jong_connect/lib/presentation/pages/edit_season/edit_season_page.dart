import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/provider/season_details.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/usecase/season_use_case.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../domain/model/season.dart';

class EditSeasonPage extends ConsumerStatefulWidget {
  const EditSeasonPage(
      {super.key, required this.groupId, required this.seasonId});

  final int groupId;
  final int seasonId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditSeasonFormState();
}

class _EditSeasonFormState extends ConsumerState<EditSeasonPage> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> updateSeason(Season oldSeason) async {
    if (!_formKey.currentState!.saveAndValidate()) {
      _btnController.reset();
      return;
    }

    try {
      var newSeason = oldSeason.copyWith(
        name: _formKey.currentState!.value["name"],
        description: _formKey.currentState!.value["description"],
      );

      await ref.read(seasonUseCaseProvider).updateSeason(newSeason);

      _btnController.success();
      context.pop();

      Flushbar(
        message: 'シーズン情報を更新しました',
        icon: const Icon(
          Icons.check_circle,
          color: Colors.greenAccent,
        ),
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
      ).show(context);
    } catch (error) {
      Flushbar(
        message: 'シーズンの更新に失敗しました。時間を空けて再度お試しください',
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
      ).show(context);
      _btnController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('シーズン編集'),
      ),
      body: AsyncValueWidget(
        asyncValue: ref.watch(seasonDetailsProvider(seasonId: widget.seasonId)),
        data: (season) {
          if (season == null) {
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
                  name: "name",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: season.name,
                  decoration: const InputDecoration(labelText: 'シーズン名'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.maxLength(20),
                  ]),
                ),
                gapH16,
                FormBuilderTextField(
                  name: "description",
                  maxLines: 3,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: season.description,
                  decoration: const InputDecoration(labelText: 'シーズン説明'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.maxLength(50,
                        checkNullOrEmpty: false),
                  ]),
                ),
                gapH16,
                RoundedLoadingButton(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  successIcon: Icons.check,
                  failedIcon: Icons.cottage,
                  controller: _btnController,
                  onPressed: () => {updateSeason(season)},
                  child: Text(
                    '更新',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
