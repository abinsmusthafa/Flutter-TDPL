import 'dart:io';

class CheckInternet {
  static final CheckInternet _singleton = CheckInternet._internal();

  factory CheckInternet() {
    return _singleton;
  }

  CheckInternet._internal();

  Future<bool> verifyOnline() async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else
        isOnline = false;
    } on SocketException catch (_) {
      isOnline = false;
    }

    return isOnline;
  }
}
