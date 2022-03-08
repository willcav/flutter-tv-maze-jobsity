import '../../entities/search_people/person_basic_info_entity.dart';

/// Search People By Name Use Case
///
/// This Use Case is Responsible for Fetching a List of People Info given a specific search parameter (person name as paramenter).
abstract class SearchPeopleByNameUseCase {
  Future<List<PersonBasicInfoEntity>> call({required String input});
}
