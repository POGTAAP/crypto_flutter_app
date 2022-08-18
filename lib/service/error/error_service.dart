class ErrorService {
  bool isUnauthorized(int code) {
    return code == 401 ? true : false;
  }

  bool hasNotFound(int code) {
    return code == 404 ? true : false;
  }

  bool hasForbidden(int code) {
    return code == 403 ? true : false;
  }

  bool isInternalServerError(int code) {
    return code == 500 ? true : false;
  }
}
