import '../domain/use_cases/list_all_series/get_all_series_paginated_use_case.dart';
import '../presentation/presenters/home_presenter/getx_home_presenter.dart';
import '../presentation/presenters/home_presenter/home_presenter.dart';
import '../presentation/presenters/main_navigation_presenter/getx_main_navigation_presenter.dart';
import '../presentation/presenters/main_navigation_presenter/main_navigation_presenter.dart';
import 'package:get_it/get_it.dart';

import '../data/http/http_client.dart';
import 'factories/http/dio_adapter_factory.dart';
import 'factories/use_cases/remote_get_all_series_paginated_factory.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Presenters
  serviceLocator.registerFactory<HomePresenter>(
    () => GetxHomePresenter(
      getAllSeriesPaginatedUseCase: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<MainNavigationPresenter>(
    () => GetxMainNavigationPresenter(),
  );

  // Use Cases
  serviceLocator.registerLazySingleton<GetAllSeriesPaginatedUseCase>(
    makeRemoteGetAllSeriesPaginated,
  );

  // HttpClient Dio Adapater
  serviceLocator.registerLazySingleton<HttpClient>(
    makeDioAdapter,
  );
}
