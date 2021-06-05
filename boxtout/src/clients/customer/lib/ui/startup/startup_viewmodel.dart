import 'package:customer/app/app.locator.dart';
import 'package:customer/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// Business logic and view states
class StartUpViewModel extends BaseViewModel {
  final NavigationService? _navigationService = locator<NavigationService>();
  String title = '';
  void doSomething() {
    // title += "new updated";
    // _navigationService.navigateTo(Routes.secondView);
    notifyListeners();
  }
}
