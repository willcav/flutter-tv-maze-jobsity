import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_series_details/series_detailed_info_entity.dart';

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
