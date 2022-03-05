import '../domain/errors/domain_error.dart';

abstract class BaseError extends DomainError {
  const BaseError({String message = ''}) : super(message: message);
}
