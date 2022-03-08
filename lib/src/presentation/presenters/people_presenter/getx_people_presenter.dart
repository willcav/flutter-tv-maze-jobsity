import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_all_series/series_basic_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/mixins/loading_manager.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/people_presenter/people_presenter.dart';
import 'package:get/get.dart';

class GetxPeoplePresenter extends GetxController
    with LoadingManager
    implements PeoplePresenter {
  final _peopleList = Rx<List<SeriesBasicInfoEntity>>(const []);

  @override
  Stream<List<SeriesBasicInfoEntity>> get peopleListStream =>
      _peopleList.stream;
}
