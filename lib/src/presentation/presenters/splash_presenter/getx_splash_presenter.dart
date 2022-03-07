import 'package:flutter_tv_maze_jobsity/src/presentation/mixins/navigation_manager/navigation_arguments.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/mixins/navigation_manager/presenter_navigation_manager.dart';
import 'package:flutter_tv_maze_jobsity/src/routes/app_routes.dart';
import 'package:get/get.dart';

import 'splash_presenter.dart';

class GetxSplashPresenter extends GetxController
    with PresenterNavigationManager
    implements SplashPresenter {
  @override
  void goToMainPage() {
    navigateToWithArgs = const NavigationArguments(AppRoutes.mainNavigationPage,
        clearStack: true);
  }
}
