import 'package:flutter_tv_maze_jobsity/src/data/cache/cache_error.dart';
import 'package:flutter_tv_maze_jobsity/src/data/cache/save_string_list_data_storage.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/fetch_all_favorite_series_ids/fetch_all_favorite_series_ids_use_case.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/save_favorite_series_id/save_favorite_series_id_use_case.dart';

class LocalSaveFavoriteSeriesId implements SaveFavoriteSeriesIdUseCase {
  final SaveStringListDataStorage saveStringListDataStorage;
  final FetchAllFavoriteSeriesIdsUseCase fetchAllFavoriteSeriesIdsUseCase;

  LocalSaveFavoriteSeriesId({
    required this.saveStringListDataStorage,
    required this.fetchAllFavoriteSeriesIdsUseCase,
  });

  @override
  Future<void> call({required String id}) async {
    try {
      const key = 'favoriteList';

      final currentList = await fetchAllFavoriteSeriesIdsUseCase.call();

      currentList.add(id);

      await saveStringListDataStorage.saveList(key: key, value: currentList);
    } on CacheError catch (e) {
      throw e.convertError();
    }
  }
}
