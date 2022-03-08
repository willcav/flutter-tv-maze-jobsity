import 'package:flutter_tv_maze_jobsity/src/data/models/get_all_series/series_basic_info_model.dart';
import 'package:flutter_tv_maze_jobsity/src/data/models/get_cast_credits/character_info_model.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_cast_credits/cast_credit_info_entity.dart';

class CastCreditInfoModel extends CastCreditInfoEntity {
  final SeriesBasicInfoModel seriesInfoModel;
  final CharacterInfoModel characterInfoModel;

  CastCreditInfoModel({
    required this.seriesInfoModel,
    required this.characterInfoModel,
  }) : super(
          series: seriesInfoModel,
          character: characterInfoModel,
        );

  factory CastCreditInfoModel.fromMap(Map<String, dynamic> map) {
    final seriesMap = map['_embedded']['show'];
    final characterMap = map['_embedded']['character'];

    return CastCreditInfoModel(
      seriesInfoModel: SeriesBasicInfoModel.fromMap(seriesMap ?? {}),
      characterInfoModel: CharacterInfoModel.fromMap(characterMap ?? {}),
    );
  }
}
