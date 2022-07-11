abstract class INewsException {
  final String message;
  final StackTrace? stackTrace;
  INewsException({
    required this.message,
    this.stackTrace,
  });
}

class ArgumentsException extends INewsException {
  ArgumentsException({required super.message, super.stackTrace});
}

class DatasourceException extends INewsException {
  DatasourceException({required super.message, super.stackTrace});
}
