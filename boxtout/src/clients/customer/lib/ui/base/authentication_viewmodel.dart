import 'package:customer/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final NavigationService? navigationService = locator<NavigationService>();
  final String successRoute;

  AuthenticationViewModel({required this.successRoute});
  @override
  void setFormStatus() {}

  Future saveData() async {
    final result = await runBusyFuture(runAuthentication());

    // Check result
    if (!result.hasError) {
      // Navigate to successful route
      navigationService!.replaceWith(successRoute);
    } else {
      // set validation message if we have an error
      setValidationMessage(result.errorMessage);
    }
  }

  Future<FirebaseAuthenticationResult> runAuthentication();
}
