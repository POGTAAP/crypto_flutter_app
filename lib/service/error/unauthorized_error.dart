
import '../../network/response/error_response.dart';

class UnauthorizedError extends ErrorResponse {
  UnauthorizedError(int code, String message) : super(code, message);
}
