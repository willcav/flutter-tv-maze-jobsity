import '../../../domain/entities/get_all_series/series_basic_info_entity.dart';
import '../../mixins/navigation_manager/navigation_arguments.dart';

abstract class SearchSeriesPresenter {
  void searchSeries(String input);

  Stream<List<SeriesBasicInfoEntity>> get seriesListStream;

  Stream<bool> get isLoadingStream;

  void goToSeriesDetailsPage({required SeriesBasicInfoEntity seriesEntity});

  Stream<NavigationArguments> get navigateToWithArgsStream;
}
