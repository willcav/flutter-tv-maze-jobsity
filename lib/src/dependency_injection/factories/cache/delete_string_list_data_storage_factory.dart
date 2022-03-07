import '../../../data/cache/delete_string_list_data_storage.dart';
import '../../../infra/cache/shared_preferences_adapter.dart';

DeleteStringListDataStorage makeDeleteStringListDataStorage() =>
    SharedPreferencesAdapter();
