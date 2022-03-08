import 'package:flutter_tv_maze_jobsity/src/data/models/core/image_link_options_model.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_cast_credits/character_info_entity.dart';

class CharacterInfoModel extends CharacterInfoEntity {
  final String dtoId;
  final String dtoName;
  final ImageLinkOptionsModel imageModel;

  CharacterInfoModel({
    required this.dtoId,
    required this.dtoName,
    required this.imageModel,
  }) : super(
          id: dtoId,
          name: dtoName,
          image: imageModel,
        );

  factory CharacterInfoModel.fromMap(Map<String, dynamic> map) {
    return CharacterInfoModel(
      dtoId: (map['id'] ?? '').toString(),
      dtoName: (map['name'] ?? '').toString(),
      imageModel: ImageLinkOptionsModel.fromMap(
        map['image'] ?? {},
      ),
    );
  }
}
