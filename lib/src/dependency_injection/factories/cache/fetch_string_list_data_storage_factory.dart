import '../../../data/cache/fetch_string_list_data_storage.dart';
import '../../../infra/cache/shared_preferences_adapter.dart';

FetchStringListDataStorage makeFetchStringListDataStorage() =>
    SharedPreferencesAdapter();
