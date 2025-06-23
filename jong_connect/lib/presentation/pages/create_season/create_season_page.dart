import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/usecase/season_use_case.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class CreateSeasonPage extends ConsumerStatefulWidget {
  const CreateSeasonPage({super.key, required this.groupId});

  final int groupId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateSeasonFormState();
}

class _CreateSeasonFormState extends ConsumerState<CreateSeasonPage> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> createSeason() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      _btnController.reset();
      return;
    }

    try {
      await ref.read(seasonUseCaseProvider).createGroupSeason(
          name: _formKey.currentState!.value["name"],
          description: _formKey.currentState!.value["description"] ?? '',
          groupId: widget.groupId);
      _btnController.success();
      Flushbar(
        message: 'シーズンを作成しました',
        icon: const Icon(
          Icons.check_circle,
          color: Colors.greenAccent,
        ),
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
      ).show(context);

      await Future.delayed(const Duration(seconds: 1));

      context.pop();
    } catch (error) {
      Flushbar(
        message: 'シーズンの作成に失敗しました。時間を空けて再度お試しください',
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
        title: const Text('シーズン作成'),
      ),
      body: FormBuilder(
        key: _formKey,
        child: ListView(
          padding: formPadding,
          children: [
            FormBuilderTextField(
              name: "name",
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
              decoration: const InputDecoration(labelText: 'シーズン説明'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.maxLength(50),
              ]),
            ),
            gapH16,
            RoundedLoadingButton(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              successIcon: Icons.check,
              failedIcon: Icons.cottage,
              controller: _btnController,
              onPressed: createSeason,
              child: Text(
                '作成',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
