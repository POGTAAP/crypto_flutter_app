class SocketTimeoutError implements Exception {
  final String message;

  SocketTimeoutError(this.message);

  @override
  String toString() {
    return message;
  }
}
