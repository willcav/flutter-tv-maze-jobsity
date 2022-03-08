import '../../../data/use_cases/local_check_if_series_is_favorite.dart';
import '../../../domain/use_cases/check_if_series_is_favorite/check_if_series_is_favorite_use_case.dart';
import '../../../domain/use_cases/fetch_all_favorite_series_ids/fetch_all_favorite_series_ids_use_case.dart';
import '../../injection_container.dart';

CheckIfSeriesIsFavoriteUseCase makeLocalCheckIfSeriesIsFavorite() =>
    LocalCheckIfSeriesIsFavorite(
      fetchAllFavoriteSeriesIdsUseCase:
          serviceLocator<FetchAllFavoriteSeriesIdsUseCase>(),
    );
