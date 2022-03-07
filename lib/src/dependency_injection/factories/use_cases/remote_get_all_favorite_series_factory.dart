import 'package:flutter_tv_maze_jobsity/src/data/use_cases/remote_get_all_favorite_series.dart';
import 'package:flutter_tv_maze_jobsity/src/dependency_injection/injection_container.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/get_all_favorite_series/get_all_favorite_series_use_case.dart';

import '../../../domain/use_cases/fetch_all_favorite_series_ids/fetch_all_favorite_series_ids_use_case.dart';
import '../../../domain/use_cases/get_series_by_id/get_series_by_id_use_case.dart';

GetAllFavoriteSeriesUseCase makeRemoteGetAllFavoriteSeries() =>
    RemoteGetAllFavoriteSeries(
      fetchAllFavoriteSeriesIdsUseCase:
          serviceLocator<FetchAllFavoriteSeriesIdsUseCase>(),
      getSeriesByIdUseCase: serviceLocator<GetSeriesByIdUseCase>(),
    );
