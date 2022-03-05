abstract class DomainError implements Exception {
  final String message;

  const DomainError({this.message = ''});
}
