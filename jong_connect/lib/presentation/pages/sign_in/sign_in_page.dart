import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:jong_connect/util/routing_path.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../usecase/user_auth_use_case.dart';
import '../../../util/app_sizes.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInPage> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _signIn() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      _btnController.reset();
      return;
    }

    try {
      final authState = await ref
          .read(userAuthUseCaseProvider)
          .signInWithPassword(_formKey.currentState!.value["email"],
              _formKey.currentState!.value["password"]);
      if (authState.session != null && !authState.session!.isExpired) {
        print('ログイン成功');
      } else {
        context.showErrorSnackBar(message: unexpectedErrorMessage);
      }
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: unexpectedErrorMessage);
    }

    _btnController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sign in'),
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
              obscureText: true,
              decoration: const InputDecoration(labelText: 'パスワード'),
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
            RoundedLoadingButton(
              successIcon: Icons.check,
              failedIcon: Icons.cottage,
              controller: _btnController,
              onPressed: () => _signIn(),
              child: Text('Sign In', style: TextStyle(color: Colors.white)),
            ),
            gapH16,
            TextButton(
              onPressed: () => context.go(RoutingPath.signUp),
              child: const Text('ユーザー登録'),
            ),
          ],
        ),
      ),
    );
  }
}
