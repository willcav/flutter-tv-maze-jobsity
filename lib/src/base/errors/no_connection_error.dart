import '../base_error.dart';

class NoConnectionError extends BaseError {
  const NoConnectionError({String message = ''}) : super(message: message);
}
