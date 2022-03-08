import 'package:get/get.dart';

import '../../../domain/entities/get_all_series/series_basic_info_entity.dart';
import '../../../domain/entities/get_cast_credits/cast_credit_info_entity.dart';
import '../../../domain/errors/domain_error.dart';
import '../../../domain/use_cases/get_cast_credits/get_cast_credits_use_case.dart';
import '../../../routes/app_routes.dart';
import '../../mixins/navigation_manager/navigation_arguments.dart';
import '../../mixins/navigation_manager/presenter_navigation_manager.dart';
import 'person_details_presenter.dart';

class GetxPersonDetailsPresenter extends GetxController
    with PresenterNavigationManager
    implements PersonDetailsPresenter {
  final GetCastCreditsUseCase getCastCreditsUseCase;

  GetxPersonDetailsPresenter({
    required this.getCastCreditsUseCase,
  });

  final _castCreditList = Rx<List<CastCreditInfoEntity>>(const []);

  @override
  void getCastCredits({required String personId}) async {
    try {
      final result = await getCastCreditsUseCase.call(personId: personId);

      _castCreditList.subject.add(result);
    } on DomainError catch (e) {
      _castCreditList.addError(e, StackTrace.empty);
    }
  }

  @override
  void goToSeriesDetailsPage({required SeriesBasicInfoEntity seriesEntity}) {
    navigateToWithArgs = NavigationArguments(
      AppRoutes.seriesDetailsPage,
      arguments: {
        'seriesInfo': seriesEntity,
        'heroTag': 'person${seriesEntity.id}'
      },
    );
  }

  @override
  Stream<List<CastCreditInfoEntity>> get castCreditListStream =>
      _castCreditList.stream;
}
