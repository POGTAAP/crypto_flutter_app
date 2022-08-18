import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../service/base/base_service.dart';
import '../service/error/soket_timeout_error.dart';
import '../service/error/unauthorized_error.dart';

class BaseViewModel extends ChangeNotifier {
  final BaseService _baseService;
  Exception? error;
  bool isLoading = false;
  bool navigateToLogin = false;

  BaseViewModel(this._baseService);

  Future<void> load(Function request, Function onSuccess, Function onError) async {
    isLoading = true;
    notifyListeners();
    try {
      final result = await request();
      result.fold((left) => {handleError(left, onError)}, (right) => {onSuccess(right), closeLoadingAndNotifyPage()});
    } catch (error) {
      handleError(error as Exception, onError);
    }
  }

  void handleError(Exception error, Function onError) {
    if (error is UnauthorizedError) {
      //handleLogout();
    }

    if (error is TimeoutException || error is SocketException) {
      error = SocketTimeoutError("error_socket_timeout");
    }

    closeLoadingAndNotifyPage();
    onError(error);
  }

  void closeLoadingAndNotifyPage() {
    isLoading = false;
    notifyListeners();
  }
}
