import 'package:another_flushbar/flushbar.dart';
import 'package:async_value_group/async_value_group.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/provider/current_avatars.dart';
import 'package:jong_connect/domain/provider/current_friends.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:jong_connect/presentation/common_widgets/user_section_item.dart';
import 'package:jong_connect/usecase/create_group_use_case.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../domain/model/app_user.dart';

class CreateGroupPage extends ConsumerStatefulWidget {
  const CreateGroupPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateGroupFormState();
}

class _CreateGroupFormState extends ConsumerState<CreateGroupPage> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> createGroup() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      _btnController.reset();
      return;
    }

    try {
      await ref.read(createGroupUseCaseProvider).execute(
          name: _formKey.currentState!.value["name"],
          description: _formKey.currentState!.value["description"] ?? '',
          imageUrl: _formKey.currentState!.value["imageUrl"],
          joinUsers: _formKey.currentState!.value["joinUsers"]);

      _btnController.success();
      Flushbar(
        message: 'グループを作成しました',
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
        message: 'グループの作成に失敗しました。時間を空けて再度お試しください',
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('グループ作成'),
      ),
      body: AsyncValueGroup.group3(
        ref.watch(currentUserProvider),
        ref.watch(currentFriendsProvider),
        ref.watch(currentAvatarsProvider),
      ).when(
        data: (t) => FormBuilder(
          key: _formKey,
          child: ListView(
            padding: formPadding,
            children: [
              FormBuilderTextField(
                name: "name",
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                decoration: const InputDecoration(labelText: 'グループ説明'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.maxLength(300, checkNullOrEmpty: false),
                ]),
              ),
              gapH16,
              // TODO: グループのアバターを選択できるようにする
              FormBuilderRadioGroup<String>(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(labelText: 'イメージ画像'),
                name: 'imageUrl',
                initialValue: t.$3.first.url,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                options: [
                  for (final avatar in t.$3)
                    FormBuilderChipOption(
                      value: avatar.url,
                      child: CircleAvatar(
                        minRadius: 20,
                        maxRadius: 40,
                        child: CachedNetworkImage(
                          imageUrl: avatar.url,
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
                initialValue: [t.$1!],
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                showCheckmark: false,
                options: [
                  FormBuilderChipOption(
                    value: t.$1!,
                    child: UserSectionItem(user: t.$1!),
                  ),
                  for (final friend in t.$2)
                    FormBuilderChipOption(
                      value: friend,
                      child: UserSectionItem(user: friend),
                    ),
                ],
              ),
              gapH16,
              RoundedLoadingButton(
                successIcon: Icons.check,
                failedIcon: Icons.cottage,
                controller: _btnController,
                onPressed: createGroup,
                child: Text('作成', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        error: (error, st) =>
            const Center(child: Text('Oops, something unexpected happened')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
