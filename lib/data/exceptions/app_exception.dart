abstract class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  AppException(
    this.message, [
    this.stackTrace,
  ]);

  @override
  String toString() {
    if (stackTrace != null) {
      return '$runtimeType: $message\n$stackTrace';
    }
    return '$runtimeType: $message';
  }
}

extension ExceptionExtension on Exception {
  String get message {
    if (this is AppException) {
      return (this as AppException).message;
    }
    return toString().replaceAll('Exception: ', '');
  }
}
