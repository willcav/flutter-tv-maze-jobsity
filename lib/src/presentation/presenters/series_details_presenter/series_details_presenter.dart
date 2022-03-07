import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_series_details/series_detailed_info_entity.dart';

import '../../../domain/entities/core/episode_entity.dart';
import '../../mixins/navigation_manager/navigation_arguments.dart';

abstract class SeriesDetailsPresenter {
  void getSeriesDetails({required String seriesId});

  Stream<SeriesDetailedInfoEntity?> get seriesDetailsStream;

  void goToEpisodeDetailsPage({required EpisodeEntity episode});

  Stream<NavigationArguments> get navigateToWithArgsStream;

  Stream<bool> get isLoadingStream;

  Future<bool> addSeriesToFavorites({required String id});

  Future<bool> removeSeriesFromFavorites({required String id});

  void isSeriesFavorite({required String id});

  Stream<bool> get isSeriesFavoritedStream;
}
