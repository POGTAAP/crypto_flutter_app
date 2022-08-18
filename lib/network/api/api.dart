import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../service/error/error_service.dart';
import '../../service/error/not_found_error.dart';
import '../../service/error/unauthorized_error.dart';
import '../request/network_request.dart';
import '../response/error_response.dart';
import '../header/prodplan_header_provider.dart';

abstract class Api {
  abstract Future<CryptoHeaderProvider>? headerProvider;
  final String _baseUrl = "https://pro-api.coinmarketcap.com/v1/";
  final int _timeoutDurationTimeInSeconds = 20;

  Future<Either<ErrorResponse, dynamic>> get(NetworkRequest request) async {
    final header = await headerProvider;
    final response = await http.get(Uri.parse(_baseUrl + request.endpoint), headers: header?.getHeaders()).timeout(Duration(seconds: _timeoutDurationTimeInSeconds));
    return _handleResponse(response, request);
  }

  Future<Either<ErrorResponse, dynamic>> post(NetworkRequest request) async {
    final header = await headerProvider;
    final response = await http.post(Uri.parse(_baseUrl + request.endpoint), headers: header?.getHeaders(), body: jsonEncode(request.body)).timeout(Duration(seconds: _timeoutDurationTimeInSeconds));
    return _handleResponse(response, request);
  }

  Either<ErrorResponse, dynamic> _handleResponse(http.Response response, NetworkRequest request) {
    try {
      if (_isSuccessfulResponse(response)) {
        return Right(_decodeResponseBody(response));
      } else {
        return Left(_handleError(response));
      }
    } catch (error) {
      return Left(_handleError(response));
    }
  }

  bool _isSuccessfulResponse(http.Response response) => response.statusCode >= 200 && response.statusCode <= 299;

  String _getErrorMessage(http.Response response) {
    try {
      return _decodeResponseBody(response)['message'];
    } catch (error) {
      return response.reasonPhrase.toString();
    }
  }

  dynamic _decodeResponseBody(response) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  ErrorResponse _handleError(http.Response response) {
    final service = ErrorService();

    if (service.isUnauthorized(response.statusCode)) {
      return UnauthorizedError(response.statusCode, "error_401_text");
    }

    if (service.hasNotFound(response.statusCode)) {
      return NotFoundError(response.statusCode, "error_404_text");
    }

    if (service.hasForbidden(response.statusCode)) {
      return ErrorResponse(response.statusCode, "error_403_text");
    }

    if (service.isInternalServerError(response.statusCode)) {
      return ErrorResponse(response.statusCode, "error_500_text");
    }

    return ErrorResponse(response.statusCode, _getErrorMessage(response));
  }
}
