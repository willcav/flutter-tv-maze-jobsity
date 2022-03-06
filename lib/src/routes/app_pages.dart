import 'package:get/get.dart';

import '../dependency_injection/factories/pages/main_navigation_page_factory.dart';
import 'app_routes.dart';

class AppPages {
  static const initialRoute = AppRoutes.mainNavigationPage;

  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.mainNavigationPage, page: makeMainNavigationPage),
  ];
}
