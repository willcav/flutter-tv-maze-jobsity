import 'package:flutter_tv_maze_jobsity/src/domain/entities/core/episode_entity.dart';

import 'image_link_options_model.dart';

class EpisodeModel extends EpisodeEntity {
  final String dtoId;
  final String dtoName;
  final String dtoNumber;
  final String dtoSeasonNumber;
  final ImageLinkOptionsModel imageModel;
  final String dtoSummary;

  EpisodeModel({
    required this.dtoId,
    required this.dtoName,
    required this.dtoNumber,
    required this.dtoSeasonNumber,
    required this.imageModel,
    required this.dtoSummary,
  }) : super(
          id: dtoId,
          name: dtoName,
          number: dtoNumber,
          seasonNumber: dtoSeasonNumber,
          image: imageModel,
          summary: dtoSummary,
        );

  factory EpisodeModel.fromMap(Map<String, dynamic> map) {
    return EpisodeModel(
      dtoId: (map['id'] ?? '').toString(),
      dtoName: (map['name'] ?? '').toString(),
      dtoNumber: (map['number'] ?? '').toString(),
      dtoSeasonNumber: (map['season'] ?? '').toString(),
      imageModel: ImageLinkOptionsModel.fromMap(map['image'] ?? {}),
      dtoSummary: (map['summary'] ?? '').toString(),
    );
  }
}
