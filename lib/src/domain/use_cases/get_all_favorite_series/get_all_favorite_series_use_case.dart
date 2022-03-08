import '../../entities/get_all_series/series_basic_info_entity.dart';

/// Get All Favorite Series Use Case
///
/// This Use Case is Responsible for Fetching All Favorite Series (List of Series Info).
abstract class GetAllFavoriteSeriesUseCase {
  Future<List<SeriesBasicInfoEntity>> call();
}
