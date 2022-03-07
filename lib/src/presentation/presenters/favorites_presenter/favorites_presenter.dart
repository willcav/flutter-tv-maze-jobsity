import '../../../domain/entities/get_all_series/series_basic_info_entity.dart';
import '../../mixins/navigation_manager/navigation_arguments.dart';

abstract class FavoritesPresenter {
  Stream<List<SeriesBasicInfoEntity>> get seriesListStream;

  Stream<NavigationArguments> get navigateToWithArgsStream;

  Stream<bool> get isLoadingStream;

  void goToSeriesDetailsPage({required SeriesBasicInfoEntity seriesEntity});

  void getAllFavoriteSeries();
}
