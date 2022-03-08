import 'package:get/get.dart';

import '../../../domain/entities/core/episode_entity.dart';
import '../../../domain/entities/get_series_details/series_detailed_info_entity.dart';
import '../../../domain/errors/domain_error.dart';
import '../../../domain/use_cases/check_if_series_is_favorite/check_if_series_is_favorite_use_case.dart';
import '../../../domain/use_cases/delete_favorite_series_id/delete_favorite_series_id_use_case.dart';
import '../../../domain/use_cases/fetch_series_details/fetch_series_details_use_case.dart';
import '../../../domain/use_cases/save_favorite_series_id/save_favorite_series_id_use_case.dart';
import '../../../routes/app_routes.dart';
import '../../mixins/loading_manager.dart';
import '../../mixins/navigation_manager/navigation_arguments.dart';
import '../../mixins/navigation_manager/presenter_navigation_manager.dart';
import 'series_details_presenter.dart';

class GetxSeriesDetailsPresenter extends GetxController
    with PresenterNavigationManager, LoadingManager
    implements SeriesDetailsPresenter {
  final FetchSeriesDetailsUseCase fetchSeriesDetailsUseCase;
  final SaveFavoriteSeriesIdUseCase saveFavoriteSeriesIdUseCase;
  final DeleteFavoriteSeriesIdUseCase deleteFavoriteSeriesIdUseCase;
  final CheckIfSeriesIsFavoriteUseCase checkIfSeriesIsFavoriteUseCase;

  GetxSeriesDetailsPresenter({
    required this.fetchSeriesDetailsUseCase,
    required this.saveFavoriteSeriesIdUseCase,
    required this.deleteFavoriteSeriesIdUseCase,
    required this.checkIfSeriesIsFavoriteUseCase,
  });

  final _seriesDetails = Rx<SeriesDetailedInfoEntity?>(null);
  final _isSeriesFavorited = Rx<bool>(false);

  @override
  void getSeriesDetails({required String seriesId}) async {
    try {
      final result = await fetchSeriesDetailsUseCase.call(
        params: FetchSeriesDetailsUseCaseParams(seriesId: seriesId),
      );

      _seriesDetails.subject.add(result);
    } on DomainError catch (e) {
      _seriesDetails.addError(e, StackTrace.empty);
    }
  }

  @override
  Stream<SeriesDetailedInfoEntity?> get seriesDetailsStream =>
      _seriesDetails.stream;

  @override
  Stream<bool> get isSeriesFavoritedStream => _isSeriesFavorited.stream;

  @override
  void goToEpisodeDetailsPage({required EpisodeEntity episode}) {
    navigateToWithArgs = NavigationArguments(AppRoutes.episodeDetailsPage,
        arguments: {'episode': episode});
  }

  @override
  Future<bool> addSeriesToFavorites({required String id}) async {
    try {
      await saveFavoriteSeriesIdUseCase.call(id: id);

      _isSeriesFavorited.subject.add(true);

      return true;
    } on DomainError {
      return false;
    }
  }

  @override
  void isSeriesFavorite({required String id}) async {
    try {
      final result = await checkIfSeriesIsFavoriteUseCase.call(id: id);

      _isSeriesFavorited.subject.add(result);
    } on DomainError {
      _isSeriesFavorited.subject.add(false);
    }
  }

  @override
  Future<bool> removeSeriesFromFavorites({required String id}) async {
    try {
      await deleteFavoriteSeriesIdUseCase.call(id: id);

      _isSeriesFavorited.subject.add(false);

      return true;
    } on DomainError {
      return false;
    }
  }
}
