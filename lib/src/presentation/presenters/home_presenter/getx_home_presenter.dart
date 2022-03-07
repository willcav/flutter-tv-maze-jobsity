import 'package:flutter/foundation.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/list_all_series/series_basic_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/errors/domain_error.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/mixins/navigation_manager/navigation_arguments.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/mixins/navigation_manager/presenter_navigation_manager.dart';
import 'package:flutter_tv_maze_jobsity/src/routes/app_routes.dart';
import 'package:get/get.dart';

import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/list_all_series/get_all_series_paginated_use_case.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/home_presenter/home_presenter.dart';

class GetxHomePresenter extends GetxController
    with PresenterNavigationManager
    implements HomePresenter {
  final GetAllSeriesPaginatedUseCase getAllSeriesPaginatedUseCase;

  GetxHomePresenter({
    required this.getAllSeriesPaginatedUseCase,
  });

  final _seriesList = Rx<List<SeriesBasicInfoEntity>>([]);
  final int _pageCounter = 0;

  @override
  void getAllSeries() async {
    try {
      final _params = GetAllSeriesPaginatedUseCaseParams(page: _pageCounter);

      _seriesList.subject
          .add(await getAllSeriesPaginatedUseCase.call(params: _params));
    } on DomainError catch (e) {
      debugPrint(e.toString());
      _seriesList.addError(e, StackTrace.empty);
    }
  }

  @override
  Stream<List<SeriesBasicInfoEntity>> get seriesListStream =>
      _seriesList.stream;

  @override
  void goToSearchSeriesPage() {
    navigateToWithArgs = const NavigationArguments(AppRoutes.searchSeriesPage);
  }

  @override
  void goToSeriesDetailsPage({required SeriesBasicInfoEntity seriesEntity}) {
    navigateToWithArgs = NavigationArguments(AppRoutes.seriesDetailsPage,
        arguments: {'seriesInfo': seriesEntity});
  }
}
