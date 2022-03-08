import '../../entities/get_cast_credits/character_info_entity.dart';

/// Get Character Details Use Case
///
/// This Use Case is Responsible for Fetching Information About a Character that an actor played.
abstract class GetCharacterDetailsUseCase {
  Future<CharacterInfoEntity> call({required String characterId});
}
