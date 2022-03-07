import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_all_series/series_basic_info_entity.dart';

abstract class GetAllSeriesPaginatedUseCase {
  Future<List<SeriesBasicInfoEntity>> call(
      {required GetAllSeriesPaginatedUseCaseParams params});
}

/// Parameters Class for GetAllSeriesPaginatedUseCase
class GetAllSeriesPaginatedUseCaseParams {
  final int page;

  const GetAllSeriesPaginatedUseCaseParams({
    required this.page,
  });
}
