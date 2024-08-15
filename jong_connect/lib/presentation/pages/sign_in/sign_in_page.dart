import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sign in'),
      ),
      body: const SignInForm(),
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _saveDate(DateTime date) async {
    // セーブ処理
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormBuilderDateTimePicker(
              name: 'date',
              inputType: InputType.date,
              decoration: InputDecoration(labelText: 'Select Date'),
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.saveAndValidate()) {
                  DateTime date = _formKey.currentState!.value['date'];
                  _saveDate(date);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Date saved successfully')),
                  );
                }
              },
              child: const Text('Save Date'),
            ),
          ],
        ),
      ),
    );
  }
}
