import 'package:get/get.dart';

import 'main_navigation_presenter.dart';

class GetxMainNavigationPresenter extends GetxController
    implements MainNavigationPresenter {
  final RxInt _index = RxInt(0);

  @override
  Stream<int> get index => _index.stream;

  @override
  set setIndex(int index) {
    _index.subject.add(index);
  }
}
