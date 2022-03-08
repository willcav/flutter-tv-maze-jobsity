import 'package:flutter_tv_maze_jobsity/src/data/use_cases/remote_get_cast_credits.dart';
import 'package:flutter_tv_maze_jobsity/src/dependency_injection/factories/http/api_url_factory.dart';
import 'package:flutter_tv_maze_jobsity/src/dependency_injection/injection_container.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/get_cast_credits/get_cast_credits_use_case.dart';

import '../../../data/http/http_client.dart';

GetCastCreditsUseCase makeRemoteGetCastCredits() => RemoteGetCastCredits(
      client: serviceLocator<HttpClient>(),
      url: makeApiUrl('/people'),
    );
