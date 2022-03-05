import '../base_error.dart';

class ApiError extends BaseError {
  const ApiError({String message = ''}) : super(message: message);
}
