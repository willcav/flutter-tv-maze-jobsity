import '../../../data/cache/save_string_list_data_storage.dart';
import '../../../infra/cache/shared_preferences_adapter.dart';

SaveStringListDataStorage makeSaveStringListDataStorage() =>
    SharedPreferencesAdapter();
