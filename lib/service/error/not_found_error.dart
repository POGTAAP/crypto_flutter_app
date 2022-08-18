
import '../../network/response/error_response.dart';

class NotFoundError extends ErrorResponse {
  NotFoundError(int code, String message) : super(code, message);
}
