import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:jong_connect/domain/provider/current_friends.dart';
import 'package:jong_connect/usecase/friend_use_case.dart';

import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../common_widgets/user_profile_dialog.dart';

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

  Future<void> _searchUser() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      _btnController.reset();
      return;
    }

    try {
      var user = await ref
          .read(friendUseCaseProvider)
          .findUserFromFriendId(_formKey.currentState!.value["friend_id"]);
      var friends = await ref.read(currentFriendsProvider.future);

      if (!mounted) {
        return;
      }

      await showDialog(
        context: context,
        builder: (context) => UserProfileDialog(
          user: user,
          isFriend: friends.contains(user),
        ),
      );

      _formKey.currentState?.fields['friend_id']?.reset();
    } catch (error) {
      SnackBarService.showErrorSnackBar(content: error.toString());
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
          const Text('ユーザーを探す'),
          gapH8,
          FormBuilderTextField(
            name: "friend_id",
            autovalidateMode: AutovalidateMode.onUnfocus,
            decoration: const InputDecoration(labelText: 'フレンドIDを入力'),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(8),
            ]),
          ),
          gapH8,
          RoundedLoadingButton(
            color: Theme.of(context).colorScheme.primary,
            // height: 40,
            // width: 50,
            successIcon: Icons.check,
            failedIcon: Icons.cottage,
            controller: _btnController,
            onPressed: () => _searchUser(),
            child: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ],
      ),
    );
  }
}
