/// Delete Favorite Series Id Use Case
///
/// This Use Case is Responsible for Deleting Favorite Series ID (Single Deletion).
abstract class DeleteFavoriteSeriesIdUseCase {
  Future<void> call({required String id});
}
