import 'package:get/get.dart';

import '../../presentation/mixins/navigation_manager/navigation_arguments.dart';

mixin NavigationManager {
  void handleNavigationWithArgs(Stream<NavigationArguments> stream) {
    stream.listen((page) async {
      if (page.route.isNotEmpty == true) {
        if (page.clearStack == true) {
          Get.offAllNamed(page.route, arguments: page.arguments);
        } else {
          if (page.replace) {
            Get.offAndToNamed(page.route, arguments: page.arguments);
          } else {
            Get.toNamed(page.route, arguments: page.arguments);
          }
        }
      }
    });
  }

  Future<T?>? goToPage<T>({required String route, arguments}) async {
    return Get.toNamed<T>(route, arguments: arguments);
  }

  T? getNavigationArguments<T>({required String argumentKey}) {
    if (Get.arguments != null && Get.arguments[argumentKey] != null) {
      return Get.arguments[argumentKey] as T;
    }
    return null;
  }

  void navigatorPop<T>({T? result}) {
    Get.back(result: result);
  }
}
