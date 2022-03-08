import '../get_all_series/series_basic_info_entity.dart';
import 'character_info_entity.dart';

class CastCreditInfoEntity {
  final SeriesBasicInfoEntity series;
  final CharacterInfoEntity character;

  const CastCreditInfoEntity({
    required this.series,
    required this.character,
  });
}
