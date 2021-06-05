import 'package:customer/app/app.locator.dart';
import 'package:customer/app/app.router.dart';
import 'package:customer/ui/base/authentication_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/src/firebase_authentication_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'create_account_view.form.dart';

class CreateAccountViewModel extends AuthenticationViewModel {
  final FirebaseAuthenticationService? _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  final NavigationService? _nvaigationService = locator<NavigationService>();

  CreateAccountViewModel() : super(successRoute: Routes.addressSelectionView);
  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService!.createAccountWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );

  void navigateBack() => _nvaigationService!.back();
}
