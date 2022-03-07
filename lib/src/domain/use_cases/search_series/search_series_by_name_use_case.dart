import '../../entities/get_all_series/series_basic_info_entity.dart';

abstract class SearchSeriesByNameUseCase {
  Future<List<SeriesBasicInfoEntity>> call({required String searchInput});
}
