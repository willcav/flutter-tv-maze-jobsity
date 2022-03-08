/// Check If Series Is Favorite Use Case
///
/// This use case is responsible for comparing the series ID, validating if it is stored.
abstract class CheckIfSeriesIsFavoriteUseCase {
  Future<bool> call({required String id});
}
