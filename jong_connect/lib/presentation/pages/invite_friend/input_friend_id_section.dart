import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:jong_connect/usecase/friend_use_case.dart';

import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class InputFriendIdSection extends ConsumerStatefulWidget {
  const InputFriendIdSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InputFriendIdSectionState();
}

class _InputFriendIdSectionState extends ConsumerState<InputFriendIdSection> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _addFriend() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      _btnController.reset();
      return;
    }

    try {
      await ref
          .read(friendUseCaseProvider)
          .makeFriendFromFriendId(_formKey.currentState!.value["friend_id"]);

      _formKey.currentState?.fields['friend_id']?.reset();

      await Flushbar(
        message: 'ともだちを追加しました',
        icon: const Icon(
          Icons.check,
          color: Colors.greenAccent,
        ),
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
      ).show(context);
    } catch (error) {
      context.showErrorSnackBar(message: unexpectedErrorMessage);
    } finally {
      _btnController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('ともだちを追加'),
          gapH8,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
                width: 200,
                child: FormBuilderTextField(
                  name: "friend_id",
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  decoration: const InputDecoration(labelText: 'フレンドID'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(8),
                  ]),
                ),
              ),
              gapW8,
              RoundedLoadingButton(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                height: 40,
                width: 50,
                successIcon: Icons.check,
                failedIcon: Icons.cottage,
                controller: _btnController,
                onPressed: () => _addFriend(),
                child: Text(
                  '追加',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
