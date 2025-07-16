import 'package:another_flushbar/flushbar.dart';
import 'package:async_value_group/async_value_group.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/provider/current_friends.dart';
import 'package:jong_connect/domain/provider/group_details.dart';
import 'package:jong_connect/domain/provider/group_icons.dart';
import 'package:jong_connect/presentation/common_widgets/user_section_item_vertical.dart';
import 'package:jong_connect/usecase/edit_group_use_case.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../domain/model/app_user.dart';
import '../../../util/expect.dart';

class EditGroupPage extends ConsumerStatefulWidget {
  const EditGroupPage({super.key, required this.groupId});

  final int groupId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditGroupFormState();
}

class _EditGroupFormState extends ConsumerState<EditGroupPage> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> createGroup() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      _btnController.reset();
      return;
    }

    try {
      await ref.read(editGroupUseCaseProvider).execute(
          id: widget.groupId,
          name: _formKey.currentState!.value["name"],
          description: _formKey.currentState!.value["description"],
          imageUrl: _formKey.currentState!.value["imageUrl"],
          joinUsers: _formKey.currentState!.value["joinUsers"]);

      _btnController.success();
      context.pop();

      Flushbar(
        message: 'グループ情報を更新しました',
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
        message: 'グループの更新に失敗しました。時間を空けて再度お試しください',
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
        title: const Text('グループ編集'),
      ),
      body: AsyncValueGroup.group3(
        ref.watch(groupDetailsProvider(groupId: widget.groupId)),
        ref.watch(currentFriendsProvider),
        ref.watch(groupIconsProvider),
      ).when(
        data: (value) {
          final targetUsers = value.$1.joinedUsers
              .map<AppUser>((joined) => joined.user!)
              .toList();

          targetUsers.addAll(value.$2);

          final expectedTargetUsers =
              expect(targetUsers, (AppUser element) => element.id);

          return FormBuilder(
            key: _formKey,
            child: ListView(
              padding: formPadding,
              children: [
                FormBuilderTextField(
                  name: "name",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: value.$1.name,
                  decoration: const InputDecoration(labelText: 'グループ名'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.maxLength(30),
                  ]),
                ),
                gapH16,
                FormBuilderTextField(
                  name: "description",
                  maxLines: 3,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: value.$1.description,
                  decoration: const InputDecoration(labelText: 'グループ説明'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.maxLength(300,
                        checkNullOrEmpty: false),
                  ]),
                ),
                gapH16,
                FormBuilderRadioGroup<String>(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: value.$1.imageUrl,
                  decoration: const InputDecoration(labelText: 'イメージ画像'),
                  name: 'imageUrl',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  options: [
                    for (final icon in value.$3)
                      FormBuilderChipOption(
                        value: icon.url,
                        child: CircleAvatar(
                          minRadius: 20,
                          maxRadius: 40,
                          child: CachedNetworkImage(
                            imageUrl: icon.url,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                  ],
                ),
                gapH16,
                FormBuilderFilterChip<AppUser>(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(labelText: '参加者'),
                  name: 'joinUsers',
                  initialValue: value.$1.joinedUsers
                      .map<AppUser>((joined) => joined.user!)
                      .toList(),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  showCheckmark: false,
                  options: [
                    for (final user in expectedTargetUsers)
                      FormBuilderChipOption(
                        value: user,
                        child: UserSectionItemVertical(user: user),
                      ),
                  ],
                ),
                gapH16,
                RoundedLoadingButton(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  successIcon: Icons.check,
                  failedIcon: Icons.cottage,
                  controller: _btnController,
                  onPressed: createGroup,
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
