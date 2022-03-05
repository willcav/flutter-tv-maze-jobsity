import '../base_error.dart';

class UnauthorizedError extends BaseError {
  const UnauthorizedError({String message = ''}) : super(message: message);
}
