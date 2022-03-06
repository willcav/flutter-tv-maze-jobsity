import '../../injection_container.dart';
import '../../../presentation/presenters/series_details_presenter/getx_series_details_presenter.dart';
import '../../../presentation/presenters/series_details_presenter/series_details_presenter.dart';

import '../../../domain/use_cases/fetch_series_details/fetch_series_details_use_case.dart';

SeriesDetailsPresenter makeGetxSeriesDetailsPresenter() =>
    GetxSeriesDetailsPresenter(
      fetchSeriesDetailsUseCase: serviceLocator<FetchSeriesDetailsUseCase>(),
    );
