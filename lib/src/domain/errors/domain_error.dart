/// Base Class For Exception Handling
abstract class DomainError implements Exception {
  final String message;

  Type get type => runtimeType;

  const DomainError({this.message = ''});
}
