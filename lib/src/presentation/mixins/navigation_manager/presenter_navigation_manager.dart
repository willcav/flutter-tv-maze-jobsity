import 'package:get/get.dart';

import 'navigation_arguments.dart';

mixin PresenterNavigationManager on GetxController {
  final _navigateToWithArgs =
      Rx<NavigationArguments>(const NavigationArguments(''));

  Stream<NavigationArguments> get navigateToWithArgsStream =>
      _navigateToWithArgs.stream;

  set navigateToWithArgs(NavigationArguments value) =>
      _navigateToWithArgs.subject.add(value);
}
