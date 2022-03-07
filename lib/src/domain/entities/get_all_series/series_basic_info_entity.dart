import 'package:flutter_tv_maze_jobsity/src/domain/entities/core/image_link_options_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/core/rating_entity.dart';

class SeriesBasicInfoEntity {
  final String id;
  final String name;
  final String type;
  final ImageLinkOptionsEntity image;
  final RatingEntity rating;

  const SeriesBasicInfoEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
    required this.rating,
  });
}
