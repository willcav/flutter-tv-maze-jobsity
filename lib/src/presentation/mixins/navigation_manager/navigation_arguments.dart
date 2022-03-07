class NavigationArguments {
  /// Next page route path
  final String route;

  /// Data to send to next page
  final Map<String, dynamic>? arguments;

  /// Clear the entire stack of pages
  final bool clearStack;

  /// Replace the current page
  final bool replace;

  const NavigationArguments(
    this.route, {
    this.arguments,
    this.clearStack = false,
    this.replace = false,
  });
}
