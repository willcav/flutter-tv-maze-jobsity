import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_all_series/series_basic_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/favorites_presenter/favorites_presenter.dart';
import 'package:get/get.dart';

class GetxFavoritesPresenter extends GetxController
    implements FavoritesPresenter {
  final _seriesList = Rx<List<SeriesBasicInfoEntity>>([]);

  @override
  void goToSeriesDetailsPage({required SeriesBasicInfoEntity seriesEntity}) {
    // TODO: implement goToSeriesDetailsPage
  }

  @override
  Stream<List<SeriesBasicInfoEntity>> get seriesListStream =>
      _seriesList.stream;
}
