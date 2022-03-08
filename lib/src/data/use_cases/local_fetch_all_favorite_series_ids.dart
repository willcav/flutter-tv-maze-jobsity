import '../../domain/use_cases/fetch_all_favorite_series_ids/fetch_all_favorite_series_ids_use_case.dart';
import '../cache/cache_error.dart';
import '../cache/fetch_string_list_data_storage.dart';

class LocalFetchAllFavoriteSeriesIds
    implements FetchAllFavoriteSeriesIdsUseCase {
  final FetchStringListDataStorage fetchStringListDataStorage;

  LocalFetchAllFavoriteSeriesIds({
    required this.fetchStringListDataStorage,
  });

  @override
  Future<List<String>> call() async {
    try {
      const key = 'favoriteList';

      return await fetchStringListDataStorage.fetchList(key: key);
    } on CacheError catch (e) {
      throw e.convertError();
    }
  }
}
