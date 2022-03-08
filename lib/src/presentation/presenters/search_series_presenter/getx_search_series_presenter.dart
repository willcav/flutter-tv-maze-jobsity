import 'package:get/get.dart';

import '../../../domain/entities/get_all_series/series_basic_info_entity.dart';
import '../../../domain/errors/domain_error.dart';
import '../../../domain/use_cases/search_series/search_series_by_name_use_case.dart';
import '../../../routes/app_routes.dart';
import '../../mixins/loading_manager.dart';
import '../../mixins/navigation_manager/navigation_arguments.dart';
import '../../mixins/navigation_manager/presenter_navigation_manager.dart';
import 'search_series_presenter.dart';

class GetxSearchSeriesPresenter extends GetxController
    with LoadingManager, PresenterNavigationManager
    implements SearchSeriesPresenter {
  final SearchSeriesByNameUseCase searchSeriesByNameUseCase;

  GetxSearchSeriesPresenter({required this.searchSeriesByNameUseCase}) {
    isLoading = false;
  }

  final _seriesList = Rx<List<SeriesBasicInfoEntity>>(const []);

  @override
  Stream<List<SeriesBasicInfoEntity>> get seriesListStream =>
      _seriesList.stream;

  @override
  void searchSeries(String input) async {
    try {
      if (input.length > 2) {
        if (loadingState == false) {
          isLoading = true;

          final result =
              await searchSeriesByNameUseCase.call(searchInput: input);

          _seriesList.subject.add(result);

          isLoading = false;
        }
      }

      if (input.isEmpty) {
        _seriesList.subject.add([]);
        isLoading = false;
      }
    } on DomainError catch (e) {
      isLoading = false;
      _seriesList.addError(e.toString(), StackTrace.empty);
    }
  }

  @override
  void goToSeriesDetailsPage({required SeriesBasicInfoEntity seriesEntity}) {
    navigateToWithArgs = NavigationArguments(
      AppRoutes.seriesDetailsPage,
      arguments: {
        'seriesInfo': seriesEntity,
        'heroTag': 'search${seriesEntity.id}'
      },
    );
  }
}
