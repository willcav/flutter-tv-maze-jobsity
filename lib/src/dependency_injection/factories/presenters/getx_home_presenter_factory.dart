import '../../../domain/use_cases/get_all_series/get_all_series_paginated_use_case.dart';
import '../../../presentation/presenters/home_presenter/getx_home_presenter.dart';
import '../../../presentation/presenters/home_presenter/home_presenter.dart';
import '../../injection_container.dart';

HomePresenter makeGetxHomePresenter() => GetxHomePresenter(
      getAllSeriesPaginatedUseCase:
          serviceLocator<GetAllSeriesPaginatedUseCase>(),
    );
