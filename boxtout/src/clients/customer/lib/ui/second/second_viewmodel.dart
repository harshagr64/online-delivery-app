import 'package:stacked/stacked.dart';

// Business logic and view states
class SecondViewModel extends BaseViewModel {
  String title = '';
  void doSomething() {
    title += "new updated";
    notifyListeners();
  }
}
