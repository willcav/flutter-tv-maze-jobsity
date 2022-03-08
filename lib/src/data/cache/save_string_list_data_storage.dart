/// Save String List Data Storage
///
/// Interface Responsible for Defining the Save Method that the Storage Adapter must Implement.
abstract class SaveStringListDataStorage {
  Future<bool> saveList({required String key, required List<String> value});
}
