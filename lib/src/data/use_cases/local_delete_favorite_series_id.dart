import 'package:flutter_tv_maze_jobsity/src/data/cache/cache_error.dart';

import '../../domain/use_cases/delete_favorite_series_id/delete_favorite_series_id_use_case.dart';
import '../../domain/use_cases/fetch_all_favorite_series_ids/fetch_all_favorite_series_ids_use_case.dart';
import '../cache/save_string_list_data_storage.dart';

class LocalDeleteFavoriteSeriesId implements DeleteFavoriteSeriesIdUseCase {
  final SaveStringListDataStorage saveStringListDataStorage;
  final FetchAllFavoriteSeriesIdsUseCase fetchAllFavoriteSeriesIdsUseCase;

  LocalDeleteFavoriteSeriesId({
    required this.saveStringListDataStorage,
    required this.fetchAllFavoriteSeriesIdsUseCase,
  });

  @override
  Future<void> call({required String id}) async {
    try {
      const key = 'favoriteList';

      final currentList = await fetchAllFavoriteSeriesIdsUseCase.call();

      currentList.removeWhere((element) => element == id);

      await saveStringListDataStorage.saveList(key: key, value: currentList);
    } on CacheError catch (e) {
      throw e.convertError();
    }
  }
}
