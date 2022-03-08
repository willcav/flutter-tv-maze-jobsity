import '../../../data/http/http_client.dart';
import '../../../data/use_cases/remote_get_all_series_paginated.dart';
import '../../../domain/use_cases/get_all_series/get_all_series_paginated_use_case.dart';
import '../../injection_container.dart';
import '../http/api_url_factory.dart';

GetAllSeriesPaginatedUseCase makeRemoteGetAllSeriesPaginated() =>
    RemoteGetAllSeriesPaginated(
      client: serviceLocator<HttpClient>(),
      url: makeApiUrl('/shows'),
    );
