import '../../../domain/use_cases/check_if_series_is_favorite/check_if_series_is_favorite_use_case.dart';
import '../../../domain/use_cases/delete_favorite_series_id/delete_favorite_series_id_use_case.dart';
import '../../../domain/use_cases/fetch_series_details/fetch_series_details_use_case.dart';
import '../../../domain/use_cases/save_favorite_series_id/save_favorite_series_id_use_case.dart';
import '../../../presentation/presenters/series_details_presenter/getx_series_details_presenter.dart';
import '../../../presentation/presenters/series_details_presenter/series_details_presenter.dart';
import '../../injection_container.dart';

SeriesDetailsPresenter makeGetxSeriesDetailsPresenter() =>
    GetxSeriesDetailsPresenter(
      fetchSeriesDetailsUseCase: serviceLocator<FetchSeriesDetailsUseCase>(),
      checkIfSeriesIsFavoriteUseCase:
          serviceLocator<CheckIfSeriesIsFavoriteUseCase>(),
      deleteFavoriteSeriesIdUseCase:
          serviceLocator<DeleteFavoriteSeriesIdUseCase>(),
      saveFavoriteSeriesIdUseCase:
          serviceLocator<SaveFavoriteSeriesIdUseCase>(),
    );
