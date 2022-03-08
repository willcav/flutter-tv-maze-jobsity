import '../../../data/http/http_client.dart';
import '../../../data/use_cases/remote_search_series_by_name.dart';
import '../../../domain/use_cases/search_series/search_series_by_name_use_case.dart';
import '../../injection_container.dart';
import '../http/api_url_factory.dart';

SearchSeriesByNameUseCase makeRemoteSearchSeriesByName() =>
    RemoteSearchSeriesByName(
      client: serviceLocator<HttpClient>(),
      url: makeApiUrl('/search/shows'),
    );
