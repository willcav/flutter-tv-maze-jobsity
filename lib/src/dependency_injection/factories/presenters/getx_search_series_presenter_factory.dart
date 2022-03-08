import '../../../domain/use_cases/search_series/search_series_by_name_use_case.dart';
import '../../../presentation/presenters/search_series_presenter/getx_search_series_presenter.dart';
import '../../../presentation/presenters/search_series_presenter/search_series_presenter.dart';
import '../../injection_container.dart';

SearchSeriesPresenter makeGetxSearchSeriesPresenter() =>
    GetxSearchSeriesPresenter(
      searchSeriesByNameUseCase: serviceLocator<SearchSeriesByNameUseCase>(),
    );
