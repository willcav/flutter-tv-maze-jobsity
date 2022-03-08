import 'package:get/get.dart';

import '../dependency_injection/factories/pages/episode_details_page_factory.dart';
import '../dependency_injection/factories/pages/main_navigation_page_factory.dart';
import '../dependency_injection/factories/pages/person_details_page_factory.dart';
import '../dependency_injection/factories/pages/search_series_page_factory.dart';
import '../dependency_injection/factories/pages/series_details_page_factory.dart';
import '../dependency_injection/factories/pages/splash_page_factory.dart';
import 'app_routes.dart';

class AppPages {
  static const initialRoute = AppRoutes.splashPage;

  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splashPage, page: makeSplashPage),
    GetPage(name: AppRoutes.mainNavigationPage, page: makeMainNavigationPage),
    GetPage(name: AppRoutes.seriesDetailsPage, page: makeSeriesDetailsPage),
    GetPage(name: AppRoutes.episodeDetailsPage, page: makeEpisodeDetailsPage),
    GetPage(name: AppRoutes.searchSeriesPage, page: makeSearchSeriesPage),
    GetPage(name: AppRoutes.personDetailsPage, page: makePersonDetailsPage),
  ];
}
