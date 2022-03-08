import '../../../domain/entities/search_people/person_basic_info_entity.dart';
import '../../mixins/navigation_manager/navigation_arguments.dart';

abstract class PeoplePresenter {
  void searchPeople(String input);

  Stream<List<PersonBasicInfoEntity>> get peopleListStream;

  Stream<bool> get isLoadingStream;

  void goToPersonDetailsPage({required PersonBasicInfoEntity personEntity});

  Stream<NavigationArguments> get navigateToWithArgsStream;
}
