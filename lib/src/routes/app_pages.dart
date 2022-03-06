import 'package:get/get.dart';

import '../dependency_injection/factories/pages/main_navigation_page_factory.dart';
import '../dependency_injection/factories/pages/series_details_page_factory.dart';
import 'app_routes.dart';

class AppPages {
  static const initialRoute = AppRoutes.mainNavigationPage;

  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.mainNavigationPage, page: makeMainNavigationPage),
    GetPage(name: AppRoutes.seriesDetailsPage, page: makeSeriesDetailsPage),
  ];
}
