import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_all_series/series_basic_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/errors/domain_error.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/fetch_all_favorite_series_ids/fetch_all_favorite_series_ids_use_case.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/get_all_favorite_series/get_all_favorite_series_use_case.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/get_series_by_id/get_series_by_id_use_case.dart';

class RemoteGetAllFavoriteSeries implements GetAllFavoriteSeriesUseCase {
  final FetchAllFavoriteSeriesIdsUseCase fetchAllFavoriteSeriesIdsUseCase;
  final GetSeriesByIdUseCase getSeriesByIdUseCase;

  RemoteGetAllFavoriteSeries({
    required this.fetchAllFavoriteSeriesIdsUseCase,
    required this.getSeriesByIdUseCase,
  });

  @override
  Future<List<SeriesBasicInfoEntity>> call() async {
    try {
      final favoriteSeriesIds = await fetchAllFavoriteSeriesIdsUseCase.call();

      if (favoriteSeriesIds.isEmpty) {
        return [];
      }

      final favoriteSeriesList = <SeriesBasicInfoEntity>[];

      for (var id in favoriteSeriesIds) {
        final result = await getSeriesByIdUseCase.call(id: id);

        favoriteSeriesList.add(result);
      }

      return favoriteSeriesList..sort((a, b) => a.name.compareTo(b.name));
    } on DomainError {
      rethrow;
    }
  }
}
