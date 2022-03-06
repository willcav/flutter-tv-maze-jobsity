import '../../../domain/entities/list_all_series/series_basic_info_entity.dart';

abstract class SearchSeriesPresenter {
  void searchSeries(String input);

  Stream<List<SeriesBasicInfoEntity>> get seriesListStream;

  Stream<bool> get isLoadingStream;
}
