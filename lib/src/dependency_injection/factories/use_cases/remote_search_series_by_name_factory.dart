import 'package:flutter_tv_maze_jobsity/src/dependency_injection/factories/http/api_url_factory.dart';

import '../../../data/use_cases/remote_search_series_by_name.dart';
import '../../injection_container.dart';
import '../../../domain/use_cases/search_series/search_series_by_name_use_case.dart';

import '../../../data/http/http_client.dart';

SearchSeriesByNameUseCase makeRemoteSearchSeriesByName() =>
    RemoteSearchSeriesByName(
      client: serviceLocator<HttpClient>(),
      url: makeApiUrl('/search/shows'),
    );
