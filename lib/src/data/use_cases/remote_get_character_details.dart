import 'package:flutter_tv_maze_jobsity/src/data/http/http_client.dart';
import 'package:flutter_tv_maze_jobsity/src/data/models/get_cast_credits/character_info_model.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_cast_credits/character_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/get_character_details/get_character_details_use_case.dart';

import '../../domain/errors/domain_error.dart';
import '../http/http_error.dart';

class RemoteGetCharacterDetails implements GetCharacterDetailsUseCase {
  final HttpClient client;
  final String url;

  const RemoteGetCharacterDetails({
    required this.client,
    required this.url,
  });

  @override
  Future<CharacterInfoEntity> call({required String characterId}) async {
    try {
      final composedUrl = '$url/$characterId';

      final result = await client.request(
        url: composedUrl,
        method: RequestMethod.get,
      );

      final characterDetailsResult = CharacterInfoModel.fromMap(result);

      return characterDetailsResult;
    } on HttpError catch (e) {
      throw e.convertError();
    } on DomainError {
      rethrow;
    }
  }
}
