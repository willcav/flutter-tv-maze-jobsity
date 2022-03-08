import '../../../data/http/http_client.dart';
import '../../../data/use_cases/remote_fetch_series_details.dart';
import '../../../domain/use_cases/fetch_series_details/fetch_series_details_use_case.dart';
import '../../injection_container.dart';
import '../http/api_url_factory.dart';

FetchSeriesDetailsUseCase makeRemoteFetchSeriesDetails() =>
    RemoteFetchSeriesDetails(
      client: serviceLocator<HttpClient>(),
      url: makeApiUrl('/shows'),
    );
