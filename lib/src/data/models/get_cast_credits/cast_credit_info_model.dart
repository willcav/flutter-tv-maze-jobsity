import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_cast_credits/cast_credit_info_entity.dart';

class CastCreditInfoModel extends CastCreditInfoEntity {
  final String dtoShowId;
  final String dtoCharacterId;

  CastCreditInfoModel({
    required this.dtoShowId,
    required this.dtoCharacterId,
  }) : super(
          showId: dtoShowId,
          characterId: dtoCharacterId,
        );

  factory CastCreditInfoModel._empty() {
    return CastCreditInfoModel(dtoShowId: '', dtoCharacterId: '');
  }

  factory CastCreditInfoModel.fromMap(Map<String, dynamic> map) {
    if (map['_links'] == null) {
      return CastCreditInfoModel._empty();
    }

    final showInfo = map['_links']['show']['href'];
    final characterInfo = map['_links']['character']['href'];

    return CastCreditInfoModel(
      dtoShowId: showInfo != null ? _getIdFromHref(showInfo) : '',
      dtoCharacterId:
          characterInfo != null ? _getIdFromHref(characterInfo) : '',
    );
  }

  static String _getIdFromHref(String value) {
    if (value.isEmpty) {
      return '';
    }

    final lastIndex = value.lastIndexOf('/');

    return value.substring(lastIndex + 1);
  }
}
