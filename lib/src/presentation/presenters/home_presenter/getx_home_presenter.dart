import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../base/errors/errors.dart';
import '../../../domain/entities/get_all_series/series_basic_info_entity.dart';
import '../../../domain/errors/domain_error.dart';
import '../../../domain/use_cases/get_all_series/get_all_series_paginated_use_case.dart';
import '../../../routes/app_routes.dart';
import '../../mixins/navigation_manager/navigation_arguments.dart';
import '../../mixins/navigation_manager/presenter_navigation_manager.dart';
import 'home_presenter.dart';

class GetxHomePresenter extends GetxController
    with PresenterNavigationManager
    implements HomePresenter {
  final GetAllSeriesPaginatedUseCase getAllSeriesPaginatedUseCase;

  GetxHomePresenter({
    required this.getAllSeriesPaginatedUseCase,
  });

  final _seriesList = Rx<List<SeriesBasicInfoEntity>>(const []);
  int _pageCounter = 0;
  bool _isPaginationEnabled = true;

  final List<SeriesBasicInfoEntity> _lastListReceived = [];

  @override
  Future<void> getAllSeries() async {
    try {
      final _params = GetAllSeriesPaginatedUseCaseParams(page: _pageCounter);

      final result = await getAllSeriesPaginatedUseCase.call(params: _params);

      _setResult(result);
    } on DomainError catch (e) {
      if (e.type == const NotFoundError().type) {
        _isPaginationEnabled = false;
        _seriesList.subject.add(const []);
      } else {
        debugPrint(e.toString());
        _seriesList.addError(e, StackTrace.empty);
      }
    }
  }

  void _setResult(List<SeriesBasicInfoEntity> result) {
    if (_pageCounter == 0) {
      _lastListReceived.addAll(result);
      _seriesList.subject.add(result);
    } else {
      _lastListReceived.addAll(result);
      _seriesList.subject.add(_lastListReceived);
    }
  }

  @override
  void loadMoreSeries() {
    if (_isPaginationEnabled) {
      _isPaginationEnabled = false;
      _pageCounter++;
      getAllSeries().then(
        (_) => Future.delayed(
          const Duration(seconds: 2),
          () => _isPaginationEnabled = true,
        ),
      );
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
    navigateToWithArgs = NavigationArguments(
      AppRoutes.seriesDetailsPage,
      arguments: {
        'seriesInfo': seriesEntity,
        'heroTag': 'home${seriesEntity.id}'
      },
    );
  }
}
