import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tv_maze_jobsity/src/data/use_cases/remote_get_character_details.dart';
import 'package:flutter_tv_maze_jobsity/src/dependency_injection/factories/http/api_url_factory.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_cast_credits/character_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/infra/http/dio_adapter.dart';

void main(List<String> args) {
  test(
      'Should return a instance of CharacterInfoEntity when a valid characterId is passed',
      () {
    final result = RemoteGetCharacterDetails(
      client: DioAdapter(client: Dio()),
      url: makeApiUrl('/characters'),
    );

    expect(result, isInstanceOf<CharacterInfoEntity>());
  });
}
