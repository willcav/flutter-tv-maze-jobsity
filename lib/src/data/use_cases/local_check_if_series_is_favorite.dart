import 'package:flutter_tv_maze_jobsity/src/domain/errors/domain_error.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/check_if_series_is_favorite/check_if_series_is_favorite_use_case.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/fetch_all_favorite_series_ids/fetch_all_favorite_series_ids_use_case.dart';

class LocalCheckIfSeriesIsFavorite implements CheckIfSeriesIsFavoriteUseCase {
  final FetchAllFavoriteSeriesIdsUseCase fetchAllFavoriteSeriesIdsUseCase;

  LocalCheckIfSeriesIsFavorite({
    required this.fetchAllFavoriteSeriesIdsUseCase,
  });

  @override
  Future<bool> call({required String id}) async {
    try {
      final result = await fetchAllFavoriteSeriesIdsUseCase.call();

      if (result.contains(id)) {
        return true;
      }

      return false;
    } on DomainError {
      rethrow;
    }
  }
}
