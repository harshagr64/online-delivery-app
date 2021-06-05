import 'package:customer/ui/create_account/create_account_view.form.dart';
import 'package:customer/ui/dump_widgets/authentication_layout.dart';
import 'package:customer/ui/create_account/create_account_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'fullName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class CreateAccountView extends StatelessWidget with $CreateAccountView {
  CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        body: AuthenticationLayout(
          busy: model.isBusy,
          // onNewAccountCreatTapped:(model) => model.
          onMainButtonTapped: () => model.saveData(),
          onBackPressed: model.navigateBack,
          validationMessage: model.validationMessage,
          title: 'Create Account',
          subtitle: 'Enter your Name, Email and Password for sign up.',
          mainButtonTitle: 'SIGN UP',
          form: Column(
            children: [
              TextField(
                controller: fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
              ),
            ],
          ),
          onForgotPasswordTapped: () {},
          showTermsText: true,
        ),
      ),
      viewModelBuilder: () => CreateAccountViewModel(),
    );
  }
}
