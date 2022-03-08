import 'package:flutter_tv_maze_jobsity/src/domain/entities/core/image_link_options_entity.dart';

class CharacterInfoEntity {
  final String id;
  final String name;
  final ImageLinkOptionsEntity image;

  const CharacterInfoEntity({
    required this.id,
    required this.name,
    required this.image,
  });
}
