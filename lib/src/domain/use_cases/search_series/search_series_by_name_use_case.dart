import '../../entities/get_all_series/series_basic_info_entity.dart';

/// Search Series By Name Use Case
///
/// This Use Case is Responsible for Fetching a List of Series Info given a specific search parameter (Series Name as Paramenter).
abstract class SearchSeriesByNameUseCase {
  Future<List<SeriesBasicInfoEntity>> call({required String searchInput});
}
