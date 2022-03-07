import 'package:flutter_tv_maze_jobsity/src/data/use_cases/local_fetch_all_favorite_series_ids.dart';
import 'package:flutter_tv_maze_jobsity/src/dependency_injection/injection_container.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/fetch_all_favorite_series_ids/fetch_all_favorite_series_ids_use_case.dart';

import '../../../data/cache/fetch_string_list_data_storage.dart';

FetchAllFavoriteSeriesIdsUseCase makeLocalFetchAllFavoriteSeriesIds() =>
    LocalFetchAllFavoriteSeriesIds(
      fetchStringListDataStorage: serviceLocator<FetchStringListDataStorage>(),
    );
