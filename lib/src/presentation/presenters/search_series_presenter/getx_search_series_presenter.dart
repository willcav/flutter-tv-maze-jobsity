import 'package:flutter_tv_maze_jobsity/src/domain/entities/list_all_series/series_basic_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/search_series/search_series_by_name_use_case.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/search_series_presenter/search_series_presenter.dart';
import 'package:get/get.dart';

class GetxSearchSeriesPresenter extends GetxController
    implements SearchSeriesPresenter {
  final SearchSeriesByNameUseCase searchSeriesByNameUseCase;

  GetxSearchSeriesPresenter({required this.searchSeriesByNameUseCase});

  final _seriesList = Rx<List<SeriesBasicInfoEntity>>(const []);

  @override
  Stream<List<SeriesBasicInfoEntity>> get seriesListStream =>
      _seriesList.stream;
}
