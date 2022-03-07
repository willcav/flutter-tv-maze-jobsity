import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_series_details/series_detailed_info_entity.dart';

import '../../../domain/entities/core/episode_entity.dart';
import '../../mixins/navigation_manager/navigation_arguments.dart';

abstract class SeriesDetailsPresenter {
  void getSeriesDetails({required String seriesId});

  Stream<SeriesDetailedInfoEntity?> get seriesDetailsStream;

  void goToEpisodeDetailsPage({required EpisodeEntity episode});

  Stream<NavigationArguments> get navigateToWithArgsStream;
}
