/// Save Favorite Series Id Use Case
///
/// This Use Case is Responsible for Saving a Favorited Series ID.
abstract class SaveFavoriteSeriesIdUseCase {
  Future<void> call({required String id});
}
