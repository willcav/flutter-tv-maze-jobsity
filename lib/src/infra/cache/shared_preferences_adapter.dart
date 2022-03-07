import 'package:flutter/foundation.dart';
import 'package:flutter_tv_maze_jobsity/src/data/cache/cache_error.dart';
import 'package:flutter_tv_maze_jobsity/src/data/cache/delete_string_list_data_storage.dart';
import 'package:flutter_tv_maze_jobsity/src/data/cache/fetch_string_list_data_storage.dart';
import 'package:flutter_tv_maze_jobsity/src/data/cache/save_string_list_data_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter
    implements
        SaveStringListDataStorage,
        FetchStringListDataStorage,
        DeleteStringListDataStorage {
  @override
  Future<bool> deleteList({required String key}) async {
    try {
      final storage = await SharedPreferences.getInstance();
      return storage.remove(key);
    } catch (e) {
      debugPrint(e.toString());
      throw CacheError.failedToDelete();
    }
  }

  @override
  Future<List<String>> fetchList({required String key}) async {
    try {
      final storage = await SharedPreferences.getInstance();
      return storage.getStringList(key) ?? [];
    } catch (e) {
      debugPrint(e.toString());
      throw CacheError.failedToRetrieveData();
    }
  }

  @override
  Future<bool> saveList(
      {required String key, required List<String> value}) async {
    try {
      final storage = await SharedPreferences.getInstance();
      return storage.setStringList(key, value);
    } catch (e) {
      debugPrint(e.toString());
      throw CacheError.failedToSave();
    }
  }
}
