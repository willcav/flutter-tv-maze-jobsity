import '../../entities/get_cast_credits/cast_credit_info_entity.dart';

/// Get Cast Credits Use Case
///
/// This Use Case is Responsible for Fetching All Fimography of a person. Given a Person ID.
abstract class GetCastCreditsUseCase {
  Future<List<CastCreditInfoEntity>> call({required String personId});
}
