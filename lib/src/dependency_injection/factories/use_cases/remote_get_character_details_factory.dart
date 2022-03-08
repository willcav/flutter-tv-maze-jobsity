import '../../../data/http/http_client.dart';
import '../../../data/use_cases/remote_get_character_details.dart';
import '../../../domain/use_cases/get_character_details/get_character_details_use_case.dart';
import '../../injection_container.dart';
import '../http/api_url_factory.dart';

GetCharacterDetailsUseCase makeRemoteGetCharacterDetails() =>
    RemoteGetCharacterDetails(
      client: serviceLocator<HttpClient>(),
      url: makeApiUrl('/characters'),
    );
