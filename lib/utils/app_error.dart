class AppError {
  final int? _code;
  final String? _description;

  AppError(this._code, this._description);

  int? get code => _code;

  String? get description => _description;

  static AppError noInternet = AppError(ErrorCode.NO_INTERNET, 'check_network');
  static AppError serverError = AppError(ErrorCode.SERVER_ERROR, 'server_communication_failed');

  static AppError emptyData = AppError(ErrorCode.EMPTY_DATA, 'empty data');

  @override
  String toString() {
    return 'AppError{code : $_code, description : " $_description "}';
  }
}

class ErrorCode {
  static const int NO_INTERNET = 100;

  static const int SERVER_ERROR = 101;

  static const int EMPTY_DATA = 405;
}
