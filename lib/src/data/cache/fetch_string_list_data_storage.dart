/// Fetch String List Data Storage
///
/// Interface Responsible for Defining the Fetch Method that the Storage Adapter must Implement.
abstract class FetchStringListDataStorage {
  Future<List<String>> fetchList({required String key});
}
