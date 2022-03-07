import 'package:flutter_tv_maze_jobsity/src/data/use_cases/local_delete_favorite_series_id.dart';
import 'package:flutter_tv_maze_jobsity/src/dependency_injection/injection_container.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/delete_favorite_series_id/delete_favorite_series_id_use_case.dart';

import '../../../data/cache/save_string_list_data_storage.dart';
import '../../../domain/use_cases/fetch_all_favorite_series_ids/fetch_all_favorite_series_ids_use_case.dart';

DeleteFavoriteSeriesIdUseCase makeLocalDeleteFavoriteSeriesId() =>
    LocalDeleteFavoriteSeriesId(
      saveStringListDataStorage: serviceLocator<SaveStringListDataStorage>(),
      fetchAllFavoriteSeriesIdsUseCase:
          serviceLocator<FetchAllFavoriteSeriesIdsUseCase>(),
    );
