import 'package:flutter_tv_maze_jobsity/src/data/models/core/genres_model.dart';
import 'package:flutter_tv_maze_jobsity/src/data/models/core/image_link_options_model.dart';
import 'package:flutter_tv_maze_jobsity/src/data/models/core/rating_model.dart';
import 'package:flutter_tv_maze_jobsity/src/data/models/core/schedule_info_model.dart';
import 'package:flutter_tv_maze_jobsity/src/data/models/core/season_model.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_series_details/series_detailed_info_entity.dart';

class SeriesDetailedInfoModel extends SeriesDetailedInfoEntity {
  final String dtoId;
  final String dtoName;
  final String dtoType;
  final ImageLinkOptionsModel imageModel;
  final RatingModel ratingModel;
  final GenresModel genresModel;
  final ScheduleInfoModel scheduleModel;
  final String dtoSummary;
  final List<SeasonModel> seasonsModel;

  SeriesDetailedInfoModel({
    required this.dtoId,
    required this.dtoName,
    required this.dtoType,
    required this.imageModel,
    required this.ratingModel,
    required this.genresModel,
    required this.scheduleModel,
    required this.dtoSummary,
    required this.seasonsModel,
  }) : super(
          id: dtoId,
          name: dtoName,
          type: dtoType,
          image: imageModel,
          rating: ratingModel,
          genres: genresModel,
          schedule: scheduleModel,
          summary: dtoSummary,
          seasons: seasonsModel,
        );

  factory SeriesDetailedInfoModel.fromMap(Map<String, dynamic> map) {
    final seasons = _sortEpisodesBySeason(map)
        .entries
        .map((item) => SeasonModel.fromMap(item.value))
        .toList();

    return SeriesDetailedInfoModel(
      dtoId: (map['id'] ?? '').toString(),
      dtoName: (map['name'] ?? '').toString(),
      dtoType: (map['type'] ?? '').toString(),
      imageModel: ImageLinkOptionsModel.fromMap(map['image'] ?? {}),
      ratingModel: RatingModel.fromMap(map['rating'] ?? {}),
      genresModel: GenresModel.fromMap(map),
      scheduleModel: ScheduleInfoModel.fromMap(map['schedule'] ?? {}),
      dtoSummary: (map['summary'] ?? '').toString(),
      seasonsModel: seasons,
    );
  }

  static Map<String, dynamic> _sortEpisodesBySeason(Map<String, dynamic> map) {
    final unsortedEpisodes = map['_embedded']['episodes'];

    if (unsortedEpisodes == null) {
      return const {};
    }

    final sortedEpisodes = <String, dynamic>{};

    for (final episode in (unsortedEpisodes as List)) {
      final season = episode['season'];

      if (season == null) continue;

      if (sortedEpisodes.containsKey(season.toString())) {
        (sortedEpisodes[season.toString()]['episodes'] as List).add(episode);
      } else {
        sortedEpisodes.addEntries([
          MapEntry(season.toString(), {
            "season": season.toString(),
            "episodes": [episode],
          })
        ]);
      }
    }

    return sortedEpisodes;
  }

  /*
  
    {
      "1": {
      "season": 1,
      "episodes": [
        {
          "id": 32352,
          "url": "https://www.tvmaze.com/episodes/32352/covert-affairs-1x01-pilot",
          "name": "Pilot",
          "season": 1,
          "number": 1,
          "type": "regular",
          "airdate": "2010-07-13",
          "airtime": "22:00",
          "airstamp": "2010-07-14T02:00:00+00:00",
          "runtime": 60,
          "rating": {
            "average": 8.3
          },
          "image": {
            "medium": "https://static.tvmaze.com/uploads/images/medium_landscape/255/639143.jpg",
            "original": "https://static.tvmaze.com/uploads/images/original_untouched/255/639143.jpg"
          },
          "summary": "<p>Annie Walker is removed from CIA training and thrust into the inner sanctum of the Agency for what appears to be their need of her exceptional linguistic skills, but there may be something or someone from her past that her CIA bosses are really after.</p>",
          "_links": {
            "self": {
              "href": "https://api.tvmaze.com/episodes/32352"
            }
          }
        },
      ]
    }
    }
  
   */
}
