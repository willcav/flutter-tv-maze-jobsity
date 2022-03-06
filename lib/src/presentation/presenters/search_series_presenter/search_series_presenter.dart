import '../../../domain/entities/list_all_series/series_basic_info_entity.dart';

abstract class SearchSeriesPresenter {
  Stream<List<SeriesBasicInfoEntity>> get seriesListStream;
}
