import 'package:flutter_tv_maze_jobsity/src/domain/entities/core/season_entity.dart';

import '../core/genres_entity.dart';
import '../core/image_link_options_entity.dart';
import '../core/rating_entity.dart';
import '../core/schedule_info_entity.dart';

class SeriesDetailedInfoEntity {
  final String id;
  final String name;
  final String type;
  final ImageLinkOptionsEntity image;
  final RatingEntity rating;
  final GenresEntity genres;
  final ScheduleInfoEntity schedule;
  final String summary;
  final List<SeasonEntity> seasons;

  const SeriesDetailedInfoEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
    required this.rating,
    required this.genres,
    required this.schedule,
    required this.summary,
    required this.seasons,
  });
}
