class AppError {
  final int? _code;
  final String? _description;

  AppError(this._code, this._description);

  int? get code => _code;

  String? get description => _description;

  static AppError internalError =
      AppError(ErrorCode.INTERNAL_ERROR, 'unexpected_error_try_again');
  static AppError noInternet = AppError(ErrorCode.NO_INTERNET, 'check_network');
  static AppError serverError =
      AppError(ErrorCode.SERVER_ERROR, 'server_communication_failed');
  static AppError notFound = AppError(ErrorCode.NOT_FOUND, 'not_found');
  static AppError emptyData = AppError(ErrorCode.EMPTY_DATA, 'empty data');
  static AppError gateWayIssue = AppError(ErrorCode.GATE_WAY_ISSUE, 'GATE way issue');

  @override
  String toString() {
    return 'AppError{code : $_code, description : " $_description "}';
  }
}

class ErrorCode {
  static const int INTERNAL_ERROR = -1;
  static const int NO_INTERNET = 100;
  static const int SERVER_ERROR = 101;
  static const int NOT_FOUND = 404;
  static const int EMPTY_DATA = 405;
  static const int GATE_WAY_ISSUE = 504;
}
