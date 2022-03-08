import '../../entities/get_all_series/series_basic_info_entity.dart';

/// Get All Series Paginated Use Case
///
/// This Use Case is Responsible for Fetching All Series given a Specific Page Index.
abstract class GetAllSeriesPaginatedUseCase {
  Future<List<SeriesBasicInfoEntity>> call(
      {required GetAllSeriesPaginatedUseCaseParams params});
}

/// Parameters Class for GetAllSeriesPaginatedUseCase
class GetAllSeriesPaginatedUseCaseParams {
  final int page;

  const GetAllSeriesPaginatedUseCaseParams({
    required this.page,
  });
}
