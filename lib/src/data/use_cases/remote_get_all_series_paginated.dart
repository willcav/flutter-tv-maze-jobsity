import 'package:flutter_tv_maze_jobsity/src/domain/entities/list_all_series/series_basic_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/list_all_series/get_all_series_paginated_use_case.dart';

class RemoteGetAllSeriesPaginated implements GetAllSeriesPaginatedUseCase {
  @override
  Future<List<SeriesBasicInfoEntity>> call(
      {required GetAllSeriesPaginatedUseCaseParams params}) async {
    try {
      return [];
    } catch (e) {
      throw Exception();
    }
  }
}
