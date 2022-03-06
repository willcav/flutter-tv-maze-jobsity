import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_series_details/series_detailed_info_entity.dart';

abstract class SeriesDetailsPresenter {
  void getSeriesDetails({required String seriesId});

  Stream<SeriesDetailedInfoEntity?> get seriesDetailsStream;
}
