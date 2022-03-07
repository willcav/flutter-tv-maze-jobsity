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
    final storage = await SharedPreferences.getInstance();
    return storage.remove(key);
  }

  @override
  Future<List<String>> fetchList({required String key}) async {
    final storage = await SharedPreferences.getInstance();
    return storage.getStringList(key) ?? [];
  }

  @override
  Future<bool> saveList(
      {required String key, required List<String> value}) async {
    final storage = await SharedPreferences.getInstance();
    return storage.setStringList(key, value);
  }
}
