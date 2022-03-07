import '../../mixins/navigation_manager/navigation_arguments.dart';

abstract class SplashPresenter {
  void goToMainPage();

  Stream<NavigationArguments> get navigateToWithArgsStream;
}
