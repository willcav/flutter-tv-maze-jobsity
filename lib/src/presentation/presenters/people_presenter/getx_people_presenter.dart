import 'package:get/get.dart';

import '../../../domain/entities/search_people/person_basic_info_entity.dart';
import '../../../domain/errors/domain_error.dart';
import '../../../domain/use_cases/search_people/search_people_by_name_use_case.dart';
import '../../../routes/app_routes.dart';
import '../../mixins/loading_manager.dart';
import '../../mixins/navigation_manager/navigation_arguments.dart';
import '../../mixins/navigation_manager/presenter_navigation_manager.dart';
import 'people_presenter.dart';

class GetxPeoplePresenter extends GetxController
    with LoadingManager, PresenterNavigationManager
    implements PeoplePresenter {
  final SearchPeopleByNameUseCase searchPeopleByNameUseCase;

  GetxPeoplePresenter({
    required this.searchPeopleByNameUseCase,
  });

  final _peopleList = Rx<List<PersonBasicInfoEntity>>(const []);

  @override
  Stream<List<PersonBasicInfoEntity>> get peopleListStream =>
      _peopleList.stream;

  @override
  void goToPersonDetailsPage({required PersonBasicInfoEntity personEntity}) {
    navigateToWithArgs = NavigationArguments(
      AppRoutes.personDetailsPage,
      arguments: {'person': personEntity},
    );
  }

  @override
  void searchPeople(String input) async {
    try {
      if (input.length > 2) {
        if (loadingState == false) {
          isLoading = true;

          final result = await searchPeopleByNameUseCase.call(input: input);

          _peopleList.subject.add(result);

          isLoading = false;
        }
      }

      if (input.isEmpty) {
        _peopleList.subject.add([]);
        isLoading = false;
      }
    } on DomainError catch (e) {
      isLoading = false;
      _peopleList.addError(
        e.toString(),
        StackTrace.empty,
      );
    }
  }
}
