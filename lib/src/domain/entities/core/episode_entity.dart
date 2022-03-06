import 'package:flutter_tv_maze_jobsity/src/domain/entities/core/image_link_options_entity.dart';

class EpisodeEntity {
  final String id;
  final String name;
  final String number;
  final String seasonNumber;
  final ImageLinkOptionsEntity image;
  final String summary;

  const EpisodeEntity({
    required this.id,
    required this.name,
    required this.number,
    required this.seasonNumber,
    required this.image,
    required this.summary,
  });
}
