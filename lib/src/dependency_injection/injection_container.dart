import 'package:flutter_tv_maze_jobsity/src/dependency_injection/factories/use_cases/remote_get_cast_credits_factory.dart';
import 'package:flutter_tv_maze_jobsity/src/dependency_injection/factories/use_cases/remote_get_character_details_factory.dart';
import 'package:flutter_tv_maze_jobsity/src/dependency_injection/factories/use_cases/remote_search_people_by_name_factory.dart';
import 'package:get_it/get_it.dart';

import '../domain/use_cases/get_cast_credits/get_cast_credits_use_case.dart';
import '../domain/use_cases/get_character_details/get_character_details_use_case.dart';
import '../domain/use_cases/search_people/search_people_by_name_use_case.dart';
import 'factories/cache/save_string_list_data_storage_factory.dart';
import 'factories/presenters/getx_people_presenter_factory.dart';
import '../presentation/presenters/people_presenter/people_presenter.dart';
import '../data/cache/delete_string_list_data_storage.dart';
import '../data/cache/fetch_string_list_data_storage.dart';
import '../data/cache/save_string_list_data_storage.dart';
import 'factories/cache/delete_string_list_data_storage_factory.dart';
import 'factories/cache/fetch_string_list_data_storage_factory.dart';
import 'factories/use_cases/local_check_if_series_is_favorite_factory.dart';
import 'factories/use_cases/local_delete_favorite_series_id_factory.dart';
import 'factories/use_cases/local_fetch_all_favorite_series_ids_factory.dart';
import 'factories/use_cases/local_save_favorite_series_id_factory.dart';
import 'factories/use_cases/remote_get_all_favorite_series_factory.dart';
import 'factories/use_cases/remote_get_series_by_id_factory.dart';
import '../presentation/presenters/splash_presenter/splash_presenter.dart';
import '../domain/use_cases/check_if_series_is_favorite/check_if_series_is_favorite_use_case.dart';
import '../domain/use_cases/delete_favorite_series_id/delete_favorite_series_id_use_case.dart';
import '../domain/use_cases/fetch_all_favorite_series_ids/fetch_all_favorite_series_ids_use_case.dart';
import '../domain/use_cases/get_all_favorite_series/get_all_favorite_series_use_case.dart';
import '../domain/use_cases/get_series_by_id/get_series_by_id_use_case.dart';
import '../domain/use_cases/save_favorite_series_id/save_favorite_series_id_use_case.dart';
import '../domain/use_cases/search_series/search_series_by_name_use_case.dart';
import '../presentation/presenters/favorites_presenter/favorites_presenter.dart';
import 'factories/presenters/getx_favorites_presenter_factory.dart';
import 'factories/presenters/getx_splash_presenter_factory.dart';
import 'factories/use_cases/remote_fetch_series_details_factory.dart';
import '../domain/use_cases/fetch_series_details/fetch_series_details_use_case.dart';
import '../domain/use_cases/get_all_series/get_all_series_paginated_use_case.dart';
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

/// Initializes the Service Locator
///
/// Responsible for instantiating all classes that will be used in dependency injection
Future<void> init() async {
  // Presenters
  _initPresenters();

  // Use Cases
  _initUseCases();

  // HttpClient Dio Adapater
  _initAdapters();
}

// Initialize all Presenters
void _initPresenters() {
  serviceLocator.registerFactory<HomePresenter>(makeGetxHomePresenter);

  serviceLocator.registerFactory<MainNavigationPresenter>(
      makeGetxMainNavigationPresenter);

  serviceLocator
      .registerFactory<SeriesDetailsPresenter>(makeGetxSeriesDetailsPresenter);

  serviceLocator
      .registerFactory<SearchSeriesPresenter>(makeGetxSearchSeriesPresenter);

  serviceLocator.registerFactory<SplashPresenter>(makeGetxSplashPresenter);

  serviceLocator
      .registerFactory<FavoritesPresenter>(makeGetxFavoritesPresenter);

  serviceLocator.registerFactory<PeoplePresenter>(makeGetxPeoplePresenter);
}

// Initialize all Use Cases
void _initUseCases() {
  serviceLocator.registerLazySingleton<GetAllSeriesPaginatedUseCase>(
    makeRemoteGetAllSeriesPaginated,
  );

  serviceLocator.registerLazySingleton<FetchSeriesDetailsUseCase>(
    makeRemoteFetchSeriesDetails,
  );

  serviceLocator.registerLazySingleton<SearchSeriesByNameUseCase>(
    makeRemoteSearchSeriesByName,
  );

  serviceLocator.registerLazySingleton<GetSeriesByIdUseCase>(
    makeRemoteGetSeriesById,
  );

  serviceLocator.registerLazySingleton<GetAllFavoriteSeriesUseCase>(
    makeRemoteGetAllFavoriteSeries,
  );

  serviceLocator.registerLazySingleton<SaveFavoriteSeriesIdUseCase>(
    makeLocalSaveFavoriteSeriesId,
  );

  serviceLocator.registerLazySingleton<FetchAllFavoriteSeriesIdsUseCase>(
    makeLocalFetchAllFavoriteSeriesIds,
  );

  serviceLocator.registerLazySingleton<DeleteFavoriteSeriesIdUseCase>(
    makeLocalDeleteFavoriteSeriesId,
  );

  serviceLocator.registerLazySingleton<CheckIfSeriesIsFavoriteUseCase>(
    makeLocalCheckIfSeriesIsFavorite,
  );

  serviceLocator.registerLazySingleton<GetCharacterDetailsUseCase>(
    makeRemoteGetCharacterDetails,
  );

  serviceLocator.registerLazySingleton<GetCastCreditsUseCase>(
    makeRemoteGetCastCredits,
  );

  serviceLocator.registerLazySingleton<SearchPeopleByNameUseCase>(
    makeRemoteSearchPeopleByName,
  );
}

// Initialize all Adapters
void _initAdapters() {
  serviceLocator.registerLazySingleton<HttpClient>(
    makeDioAdapter,
  );

  serviceLocator.registerLazySingleton<SaveStringListDataStorage>(
    makeSaveStringListDataStorage,
  );

  serviceLocator.registerLazySingleton<FetchStringListDataStorage>(
    makeFetchStringListDataStorage,
  );

  serviceLocator.registerLazySingleton<DeleteStringListDataStorage>(
    makeDeleteStringListDataStorage,
  );
}
