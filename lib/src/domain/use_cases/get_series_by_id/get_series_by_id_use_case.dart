import '../../entities/get_all_series/series_basic_info_entity.dart';

/// Get Series By Id Use Case
///
/// This Use Case is Responsible for Fetching Information About a Specific Series given an series ID.
abstract class GetSeriesByIdUseCase {
  Future<SeriesBasicInfoEntity> call({required String id});
}
