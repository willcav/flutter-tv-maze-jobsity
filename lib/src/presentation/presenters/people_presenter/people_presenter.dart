import '../../../domain/entities/get_all_series/series_basic_info_entity.dart';

abstract class PeoplePresenter {
  Stream<List<SeriesBasicInfoEntity>> get peopleListStream;

  Stream<bool> get isLoadingStream;
}
