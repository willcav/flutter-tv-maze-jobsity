/// Delete String List Data Storage
///
/// Interface Responsible for Defining the Deletion Method that the Storage Adapter must Implement.
abstract class DeleteStringListDataStorage {
  Future<bool> deleteList({required String key});
}
