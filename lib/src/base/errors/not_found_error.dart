import '../base_error.dart';

class NotFoundError extends BaseError {
  const NotFoundError({String message = ''}) : super(message: message);
}
