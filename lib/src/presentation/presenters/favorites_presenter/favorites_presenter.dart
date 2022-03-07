import '../../../domain/entities/get_all_series/series_basic_info_entity.dart';

abstract class FavoritesPresenter {
  Stream<List<SeriesBasicInfoEntity>> get seriesListStream;

  void goToSeriesDetailsPage({required SeriesBasicInfoEntity seriesEntity});
}
