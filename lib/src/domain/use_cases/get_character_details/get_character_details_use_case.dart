import '../../entities/get_cast_credits/character_info_entity.dart';

abstract class GetCharacterDetailsUseCase {
  Future<CharacterInfoEntity> call({required String characterId});
}
