import '../../entities/get_series_details/series_detailed_info_entity.dart';

/// Fetch Series Details Use Case
///
/// This Use Case is Responsible for Fetching the Detail of a Given Series (by ID).
abstract class FetchSeriesDetailsUseCase {
  Future<SeriesDetailedInfoEntity> call({
    required FetchSeriesDetailsUseCaseParams params,
  });
}

class FetchSeriesDetailsUseCaseParams {
  final String seriesId;

  FetchSeriesDetailsUseCaseParams({
    required this.seriesId,
  });
}
