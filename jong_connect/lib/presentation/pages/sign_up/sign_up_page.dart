import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../usecase/user_auth_use_case.dart';
import '../../../util/routing_path.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpPage> {
  final RoundedLoadingButtonController _signUpButtonController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController _signInAnonymouslyButtonController =
      RoundedLoadingButtonController();

  final _formKey = GlobalKey<FormBuilderState>();
  bool _obscurePasswordText = true;
  bool _obscureConfirmPasswordText = true;

  Future<void> _signUpAnonymously() async {
    try {
      final authState =
          await ref.read(userAuthUseCaseProvider).signInAnonymously();
      if (authState.session != null && !authState.session!.isExpired) {
        _signInAnonymouslyButtonController.success();
        await Future.delayed(const Duration(seconds: 1));
        context.go(RoutingPath.profile);
      }
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: unexpectedErrorMessage);
    } finally {
      _signInAnonymouslyButtonController.reset();
    }
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      _signUpButtonController.reset();
      return;
    }

    try {
      final authState = await ref.read(userAuthUseCaseProvider).signUp(
          _formKey.currentState!.value["email"],
          _formKey.currentState!.value["password"]);

      if (authState.session != null && !authState.session!.isExpired) {
        _signUpButtonController.success();
        await Future.delayed(const Duration(seconds: 1));
        context.go(RoutingPath.profile);
      } else {
        context.showErrorSnackBar(message: unexpectedErrorMessage);
      }
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: unexpectedErrorMessage);
    }

    _signUpButtonController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('アカウント登録'),
      ),
      body: FormBuilder(
        key: _formKey,
        child: ListView(
          padding: formPadding,
          children: [
            FormBuilderTextField(
              name: "email",
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(labelText: 'メールアドレス'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            ),
            gapH16,
            FormBuilderTextField(
              name: "password",
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: _obscurePasswordText,
              decoration: InputDecoration(
                labelText: 'パスワード',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePasswordText
                        ? Icons.disabled_visible
                        : Icons.remove_red_eye_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePasswordText = !_obscurePasswordText;
                    });
                  },
                ),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.password(
                  minLength: 6,
                  minUppercaseCount: 0,
                  minSpecialCharCount: 0,
                ),
              ]),
            ),
            gapH16,
            FormBuilderTextField(
              name: "password_confirm",
              autovalidateMode: AutovalidateMode.onUnfocus,
              obscureText: _obscureConfirmPasswordText,
              decoration: InputDecoration(
                labelText: 'パスワード(確認)',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPasswordText
                        ? Icons.disabled_visible
                        : Icons.remove_red_eye_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPasswordText =
                          !_obscureConfirmPasswordText;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value != _formKey.currentState!.value["password"]) {
                  return 'パスワードが一致しません';
                }

                return null;
              },
            ),
            gapH16,
            RoundedLoadingButton(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              successIcon: Icons.check,
              failedIcon: Icons.cottage,
              controller: _signUpButtonController,
              onPressed: _signUp,
              child: Text(
                '登録',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
            gapH16,
            RoundedLoadingButton(
              color: Colors.transparent,
              successIcon: Icons.check,
              failedIcon: Icons.cottage,
              controller: _signInAnonymouslyButtonController,
              onPressed: _signUpAnonymously,
              valueColor: Theme.of(context).colorScheme.secondary,
              elevation: 0,
              child: const Text('ゲストとして始める'),
            ),
          ],
        ),
      ),
    );
  }
}
