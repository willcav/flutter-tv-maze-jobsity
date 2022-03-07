import 'package:flutter_tv_maze_jobsity/src/dependency_injection/injection_container.dart';

import '../../../domain/use_cases/get_all_favorite_series/get_all_favorite_series_use_case.dart';
import '../../../presentation/presenters/favorites_presenter/favorites_presenter.dart';
import '../../../presentation/presenters/favorites_presenter/getx_favorites_presenter.dart';

FavoritesPresenter makeGetxFavoritesPresenter() => GetxFavoritesPresenter(
      getAllFavoriteSeriesUseCase:
          serviceLocator<GetAllFavoriteSeriesUseCase>(),
    );
