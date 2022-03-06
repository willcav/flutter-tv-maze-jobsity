import 'episode_entity.dart';

class SeasonEntity {
  final String number;
  final List<EpisodeEntity> episodes;

  const SeasonEntity({
    required this.number,
    required this.episodes,
  });
}
