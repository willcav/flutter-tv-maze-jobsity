import 'package:flutter_tv_maze_jobsity/src/domain/entities/list_all_series/series_basic_info_entity.dart';

abstract class HomePresenter {
  void getAllSeries();

  Stream<List<SeriesBasicInfoEntity>> get seriesListStream;
}