import 'package:flutter_tv_maze_jobsity/src/data/http/http_client.dart';
import 'package:flutter_tv_maze_jobsity/src/data/http/http_error.dart';
import 'package:flutter_tv_maze_jobsity/src/data/models/search_people/person_basic_info_model.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/search_people/person_basic_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/errors/domain_error.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/search_people/search_people_by_name_use_case.dart';

class RemoteSearchPeopleByName implements SearchPeopleByNameUseCase {
  final HttpClient client;
  final String url;

  const RemoteSearchPeopleByName({
    required this.client,
    required this.url,
  });

  @override
  Future<List<PersonBasicInfoEntity>> call({required String input}) async {
    try {
      final queryParams = {'q': input};
      final result = await client.request(
        url: url,
        method: RequestMethod.get,
        queryParameters: queryParams,
      );

      final peopleListResult = (result as List)
          .map((item) => PersonBasicInfoModel.fromMap(item['person']))
          .toList();

      return peopleListResult;
    } on HttpError catch (e) {
      throw e.convertError();
    } on DomainError {
      rethrow;
    }
  }
}
