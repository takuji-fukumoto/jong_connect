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
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _signUp() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      _btnController.reset();
      return;
    }

    try {
      final authState = await ref.read(userAuthUseCaseProvider).signUp(
          _formKey.currentState!.value["email"],
          _formKey.currentState!.value["password"]);
      // TODO: signUpした瞬間にログインした状態になるのか要確認
      if (authState.session != null && !authState.session!.isExpired) {
        print('サインアップ成功');
        _btnController.success();
        await Future.delayed(const Duration(seconds: 1));
        context.go(RoutingPath.editProfile);
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
        title: const Text('Sign up'),
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
              onPressed: _signUp,
              child: Text('Sign Up', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
