import 'package:flutter_tv_maze_jobsity/src/data/http/http_client.dart';
import 'package:flutter_tv_maze_jobsity/src/data/models/list_all_series/series_basic_info_model.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/list_all_series/series_basic_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/list_all_series/get_all_series_paginated_use_case.dart';

class RemoteGetAllSeriesPaginated implements GetAllSeriesPaginatedUseCase {
  final HttpClient client;
  final String url;

  const RemoteGetAllSeriesPaginated({
    required this.client,
    required this.url,
  });

  @override
  Future<List<SeriesBasicInfoEntity>> call(
      {required GetAllSeriesPaginatedUseCaseParams params}) async {
    try {
      final result = client.request(
        url: url,
        method: RequestMethod.get,
        queryParameters:
            GetAllSeriesPaginatedUseCaseParamsModel.fromEntity(params).toMap(),
      );

      final seriesListResult = (result as List)
          .map((item) =>
              SeriesBasicInfoModel.fromMap(item as Map<String, dynamic>))
          .toList();

      return seriesListResult;
    } catch (e) {
      throw Exception();
    }
  }
}

class GetAllSeriesPaginatedUseCaseParamsModel
    extends GetAllSeriesPaginatedUseCaseParams {
  GetAllSeriesPaginatedUseCaseParamsModel({required int page})
      : super(page: page);

  factory GetAllSeriesPaginatedUseCaseParamsModel.fromEntity(
      GetAllSeriesPaginatedUseCaseParams entity) {
    return GetAllSeriesPaginatedUseCaseParamsModel(page: entity.page);
  }

  Map<String, dynamic> toMap() {
    return {'page': page};
  }
}
