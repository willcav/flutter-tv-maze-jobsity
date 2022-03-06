import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_series_details/series_detailed_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/errors/domain_error.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/use_cases/fetch_series_details/fetch_series_details_use_case.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/series_details_presenter/series_details_presenter.dart';
import 'package:get/get.dart';

class GetxSeriesDetailsPresenter extends GetxController
    implements SeriesDetailsPresenter {
  final FetchSeriesDetailsUseCase fetchSeriesDetailsUseCase;

  GetxSeriesDetailsPresenter({
    required this.fetchSeriesDetailsUseCase,
  });

  final _seriesDetails = Rx<SeriesDetailedInfoEntity?>(null);

  @override
  void getSeriesDetails({required String seriesId}) async {
    try {
      final result = await fetchSeriesDetailsUseCase.call(
        params: FetchSeriesDetailsUseCaseParams(seriesId: seriesId),
      );

      _seriesDetails.subject.add(result);
    } on DomainError catch (e) {
      _seriesDetails.addError(e, StackTrace.empty);
    }
  }

  @override
  Stream<SeriesDetailedInfoEntity?> get seriesDetailsStream =>
      _seriesDetails.stream;
}
