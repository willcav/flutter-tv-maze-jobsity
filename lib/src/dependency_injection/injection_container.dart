import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/splash_presenter/splash_presenter.dart';
import 'package:get_it/get_it.dart';

import '../domain/use_cases/search_series/search_series_by_name_use_case.dart';
import 'factories/presenters/getx_splash_presenter_factory.dart';
import 'factories/use_cases/remote_fetch_series_details_factory.dart';
import '../domain/use_cases/fetch_series_details/fetch_series_details_use_case.dart';
import '../domain/use_cases/list_all_series/get_all_series_paginated_use_case.dart';
import '../presentation/presenters/home_presenter/home_presenter.dart';
import '../presentation/presenters/main_navigation_presenter/main_navigation_presenter.dart';
import '../data/http/http_client.dart';
import '../presentation/presenters/search_series_presenter/search_series_presenter.dart';
import '../presentation/presenters/series_details_presenter/series_details_presenter.dart';
import 'factories/http/dio_adapter_factory.dart';
import 'factories/presenters/getx_home_presenter_factory.dart';
import 'factories/presenters/getx_main_navigation_presenter_factory.dart';
import 'factories/presenters/getx_search_series_presenter_factory.dart';
import 'factories/presenters/getx_series_details_presenter_factory.dart';
import 'factories/use_cases/remote_get_all_series_paginated_factory.dart';
import 'factories/use_cases/remote_search_series_by_name_factory.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Presenters
  serviceLocator.registerFactory<HomePresenter>(makeGetxHomePresenter);

  serviceLocator.registerFactory<MainNavigationPresenter>(
      makeGetxMainNavigationPresenter);

  serviceLocator
      .registerFactory<SeriesDetailsPresenter>(makeGetxSeriesDetailsPresenter);

  serviceLocator
      .registerFactory<SearchSeriesPresenter>(makeGetxSearchSeriesPresenter);

  serviceLocator.registerFactory<SplashPresenter>(makeGetxSplashPresenter);

  // Use Cases
  serviceLocator.registerLazySingleton<GetAllSeriesPaginatedUseCase>(
    makeRemoteGetAllSeriesPaginated,
  );

  serviceLocator.registerLazySingleton<FetchSeriesDetailsUseCase>(
    makeRemoteFetchSeriesDetails,
  );

  serviceLocator.registerLazySingleton<SearchSeriesByNameUseCase>(
    makeRemoteSearchSeriesByName,
  );

  // HttpClient Dio Adapater
  serviceLocator.registerLazySingleton<HttpClient>(
    makeDioAdapter,
  );
}
