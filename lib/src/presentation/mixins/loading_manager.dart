import 'package:get/get.dart';

mixin LoadingManager on GetxController {
  bool _loadingState = false;

  final _isLoading = false.obs;

  Stream<bool> get isLoadingStream => _isLoading.stream;

  set isLoading(bool value) {
    _isLoading.subject.add(value);
    _loadingState = value;
  }

  bool get loadingState => _loadingState;
}
