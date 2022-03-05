import 'package:flutter_tv_maze_jobsity/src/data/models/core/image_link_options_model.dart';
import 'package:flutter_tv_maze_jobsity/src/data/models/core/rating_model.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/list_all_series/series_basic_info_entity.dart';

class SeriesBasicInfoModel extends SeriesBasicInfoEntity {
  final String dtoId;
  final String dtoName;
  final String dtoType;
  final ImageLinkOptionsModel imageModel;
  final RatingModel ratingModel;

  const SeriesBasicInfoModel({
    required this.dtoId,
    required this.dtoName,
    required this.dtoType,
    required this.imageModel,
    required this.ratingModel,
  }) : super(
          id: dtoId,
          name: dtoName,
          type: dtoType,
          image: imageModel,
          rating: ratingModel,
        );

  factory SeriesBasicInfoModel.fromMap(Map<String, dynamic> map) {
    return SeriesBasicInfoModel(
      dtoId: (map['id'] ?? '').toString(),
      dtoName: (map['name'] ?? '').toString(),
      dtoType: (map['type'] ?? '').toString(),
      imageModel: ImageLinkOptionsModel.fromMap(map['image'] ?? {}),
      ratingModel: RatingModel.fromMap(map['rating'] ?? {}),
    );
  }
}
