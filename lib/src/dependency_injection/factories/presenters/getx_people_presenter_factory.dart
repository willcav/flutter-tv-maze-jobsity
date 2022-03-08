import '../../../domain/use_cases/search_people/search_people_by_name_use_case.dart';
import '../../../presentation/presenters/people_presenter/getx_people_presenter.dart';
import '../../../presentation/presenters/people_presenter/people_presenter.dart';
import '../../injection_container.dart';

PeoplePresenter makeGetxPeoplePresenter() => GetxPeoplePresenter(
      searchPeopleByNameUseCase: serviceLocator<SearchPeopleByNameUseCase>(),
    );
