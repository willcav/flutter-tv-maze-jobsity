import 'package:flutter_tv_maze_jobsity/src/data/http/http_client.dart';
import 'package:flutter_tv_maze_jobsity/src/data/models/get_cast_credits/cast_credit_info_model.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_cast_credits/cast_credit_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/get_cast_credits/get_cast_credits_use_case.dart';

import '../../domain/errors/domain_error.dart';
import '../http/http_error.dart';

class RemoteGetCastCredits implements GetCastCreditsUseCase {
  final HttpClient client;
  final String url;

  const RemoteGetCastCredits({
    required this.client,
    required this.url,
  });

  @override
  Future<List<CastCreditInfoEntity>> call({required String personId}) async {
    try {
      final composedUrl = '$url/$personId/castcredits';

      final result = await client.request(
        url: composedUrl,
        method: RequestMethod.get,
      );

      final castCreditListResult = (result as List)
          .map((item) => CastCreditInfoModel.fromMap(item))
          .toList();

      return castCreditListResult;
    } on HttpError catch (e) {
      throw e.convertError();
    } on DomainError {
      rethrow;
    }
  }
}
