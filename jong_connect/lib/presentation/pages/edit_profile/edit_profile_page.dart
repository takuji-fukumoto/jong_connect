import 'package:another_flushbar/flushbar.dart';
import 'package:async_value_group/async_value_group.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/provider/current_avatars.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:jong_connect/usecase/register_user_use_case.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:jong_connect/util/routing_path.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileFormState();
}

class _EditProfileFormState extends ConsumerState<EditProfilePage> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> register() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      _btnController.reset();
      return;
    }

    try {
      await ref.read(registerUserUseCaseProvider).execute(
          _formKey.currentState!.value["name"],
          _formKey.currentState!.value["profile"],
          _formKey.currentState!.value["avatarUrl"]);

      _btnController.success();
      Flushbar(
        message: 'ユーザー情報を更新しました',
        icon: const Icon(
          Icons.check_circle,
          color: Colors.greenAccent,
        ),
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
      ).show(context);

      await Future.delayed(const Duration(seconds: 1));

      // TODO: 設定画面から変更した場合は一個前の画面に戻る or 設定画面での編集ページは別ページにする
      context.go(RoutingPath.home);
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: unexpectedErrorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('ユーザー設定'),
      ),
      body: AsyncValueGroup.group2(
        ref.watch(currentUserProvider),
        ref.watch(currentAvatarsProvider),
      ).when(
        data: (t) => FormBuilder(
          key: _formKey,
          child: ListView(
            padding: formPadding,
            children: [
              FormBuilderTextField(
                name: "name",
                initialValue: t.$1?.name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(labelText: 'ユーザー名'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.maxLength(30),
                ]),
              ),
              gapH16,
              FormBuilderTextField(
                name: "profile",
                initialValue: t.$1?.profile,
                maxLines: 3,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(labelText: 'プロフィール'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.maxLength(300, checkNullOrEmpty: false),
                ]),
              ),
              gapH16,
              FormBuilderChoiceChip<String>(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(labelText: 'アバター'),
                name: 'avatarUrl',
                initialValue: t.$1?.avatarUrl,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                options: [
                  for (final avatar in t.$2)
                    FormBuilderChipOption(
                      value: avatar.url,
                      avatar: CircleAvatar(
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
                      child: const SizedBox(
                        height: 60,
                      ),
                    ),
                ],
              ),
              gapH16,
              RoundedLoadingButton(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                successIcon: Icons.check,
                failedIcon: Icons.cottage,
                controller: _btnController,
                onPressed: register,
                child: Text(
                  '登録',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
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
