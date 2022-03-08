import 'package:flutter_tv_maze_jobsity/src/data/use_cases/remote_search_people_by_name.dart';
import 'package:flutter_tv_maze_jobsity/src/dependency_injection/factories/http/api_url_factory.dart';
import 'package:flutter_tv_maze_jobsity/src/dependency_injection/injection_container.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/search_people/search_people_by_name_use_case.dart';

import '../../../data/http/http_client.dart';

SearchPeopleByNameUseCase makeRemoteSearchPeopleByName() =>
    RemoteSearchPeopleByName(
      client: serviceLocator<HttpClient>(),
      url: makeApiUrl('/search/people'),
    );
