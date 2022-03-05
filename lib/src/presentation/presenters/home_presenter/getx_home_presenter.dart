import 'package:flutter/foundation.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/core/image_link_options_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/core/rating_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/list_all_series/series_basic_info_entity.dart';
import 'package:get/get.dart';

import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/list_all_series/get_all_series_paginated_use_case.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/home_presenter/home_presenter.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  // final GetAllSeriesPaginatedUseCase getAllSeriesPaginatedUseCase;

  // GetxHomePresenter({
  //   required this.getAllSeriesPaginatedUseCase,
  // });

  final _seriesList = Rx<List<SeriesBasicInfoEntity>>([]);
  final int _pageCounter = 0;

  final _mockList = List.generate(
    5,
    (index) => const SeriesBasicInfoEntity(
      id: '1',
      name: 'Name',
      type: 'Type',
      image: ImageLinkOptionsEntity(
          medium:
              'https://static.tvmaze.com/uploads/images/medium_portrait/2/5349.jpg',
          original: ''),
      rating: RatingEntity(average: '9'),
    ),
  )..add(
      const SeriesBasicInfoEntity(
        id: '2',
        name: 'Name',
        type: 'Type',
        image: ImageLinkOptionsEntity(
            medium:
                'https://static.tvmaze.com/uploads/images/medium_portrait/2/5349.jpg',
            original: ''),
        rating: RatingEntity(average: '8'),
      ),
    );

  @override
  void getAllSeries() async {
    try {
      final _params = GetAllSeriesPaginatedUseCaseParams(page: _pageCounter);

      await Future.delayed(const Duration(seconds: 2));

      _seriesList.subject.add(_mockList);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Stream<List<SeriesBasicInfoEntity>> get seriesListStream =>
      _seriesList.stream;
}
