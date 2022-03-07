import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_all_series/series_basic_info_entity.dart';

abstract class GetSeriesByIdUseCase {
  Future<SeriesBasicInfoEntity> call({required String id});
}
