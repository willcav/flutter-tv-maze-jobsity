/// Fetch All Favorite Series Ids Use Case
///
/// This Use Case is Responsible for Fetching All Stored IDs of Favorite Series.
abstract class FetchAllFavoriteSeriesIdsUseCase {
  Future<List<String>> call();
}
