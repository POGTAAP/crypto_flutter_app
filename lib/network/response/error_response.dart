class ErrorResponse implements Exception {
  final int code;
  final String message;

  ErrorResponse(this.code, this.message);

  @override
  String toString() {
    return message;
  }
}
