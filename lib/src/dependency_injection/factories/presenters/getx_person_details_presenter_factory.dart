import '../../../domain/use_cases/get_cast_credits/get_cast_credits_use_case.dart';
import '../../../presentation/presenters/person_details_presenter/getx_person_details_presenter.dart';
import '../../../presentation/presenters/person_details_presenter/person_details_presenter.dart';
import '../../injection_container.dart';

PersonDetailsPresenter makeGetxPersonDetailsPresenter() =>
    GetxPersonDetailsPresenter(
      getCastCreditsUseCase: serviceLocator<GetCastCreditsUseCase>(),
    );
