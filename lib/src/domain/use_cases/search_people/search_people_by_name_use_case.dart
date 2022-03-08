import '../../entities/search_people/person_basic_info_entity.dart';

abstract class SearchPeopleByNameUseCase {
  Future<List<PersonBasicInfoEntity>> call({required String input});
}
