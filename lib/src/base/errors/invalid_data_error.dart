import '../base_error.dart';

class InvalidDataError extends BaseError {
  const InvalidDataError({String message = ''}) : super(message: message);
}
