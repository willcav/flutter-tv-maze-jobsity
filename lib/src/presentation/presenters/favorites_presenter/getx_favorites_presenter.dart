import 'package:get/get.dart';

import '../../../domain/entities/get_all_series/series_basic_info_entity.dart';
import '../../../domain/errors/domain_error.dart';
import '../../../domain/use_cases/get_all_favorite_series/get_all_favorite_series_use_case.dart';
import '../../../routes/app_routes.dart';
import '../../mixins/loading_manager.dart';
import '../../mixins/navigation_manager/navigation_arguments.dart';
import '../../mixins/navigation_manager/presenter_navigation_manager.dart';
import 'favorites_presenter.dart';

class GetxFavoritesPresenter extends GetxController
    with PresenterNavigationManager, LoadingManager
    implements FavoritesPresenter {
  final GetAllFavoriteSeriesUseCase getAllFavoriteSeriesUseCase;

  GetxFavoritesPresenter({
    required this.getAllFavoriteSeriesUseCase,
  });

  final _seriesList = Rx<List<SeriesBasicInfoEntity>>([]);

  @override
  void goToSeriesDetailsPage({required SeriesBasicInfoEntity seriesEntity}) {
    navigateToWithArgs = NavigationArguments(
      AppRoutes.seriesDetailsPage,
      arguments: {
        'seriesInfo': seriesEntity,
        'heroTag': 'favorite${seriesEntity.id}'
      },
    );
  }

  @override
  Stream<List<SeriesBasicInfoEntity>> get seriesListStream =>
      _seriesList.stream;

  @override
  void getAllFavoriteSeries() async {
    try {
      isLoading = true;
      final result = await getAllFavoriteSeriesUseCase.call();

      _seriesList.subject.add(result);
      isLoading = false;
    } on DomainError catch (e) {
      isLoading = false;
      _seriesList.addError(e, StackTrace.empty);
    }
  }
}
