import 'package:flutter_tv_maze_jobsity/src/data/models/core/episode_model.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/core/season_entity.dart';

class SeasonModel extends SeasonEntity {
  final String dtoNumber;
  final List<EpisodeModel> episodesModel;

  SeasonModel({
    required this.dtoNumber,
    required this.episodesModel,
  }) : super(
          number: dtoNumber,
          episodes: episodesModel,
        );

  factory SeasonModel.fromMap(Map<String, dynamic> map) {
    final episodes = map['episodes'];

    return SeasonModel(
      dtoNumber: (map["season"] ?? '').toString(),
      episodesModel: episodes != null
          ? (episodes as List)
              .map((item) => EpisodeModel.fromMap(item))
              .toList()
          : const [],
    );
  }
}
