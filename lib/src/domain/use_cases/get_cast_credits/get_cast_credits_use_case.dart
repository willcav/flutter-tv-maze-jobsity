import '../../entities/get_cast_credits/cast_credit_info_entity.dart';

abstract class GetCastCreditsUseCase {
  Future<List<CastCreditInfoEntity>> call({required String personId});
}
