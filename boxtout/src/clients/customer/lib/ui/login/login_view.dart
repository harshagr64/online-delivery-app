import 'package:customer/ui/dump_widgets/authentication_layout.dart';
import 'package:customer/ui/login/login_view.form.dart';
import 'package:customer/ui/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        body: AuthenticationLayout(
          busy: model.isBusy,
          onNewAccountCreatTapped: model.navigateToCreateAccount,
          validationMessage: model.validationMessage,
          onMainButtonTapped: () => model.saveData(),
          title: 'Welcome',
          mainButtonTitle: 'SIGN IN',
          subtitle: 'Enter your email address to sign in. Enjoy your food',
          form: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
              ),
            ],
          ),
          onForgotPasswordTapped: () {},
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
