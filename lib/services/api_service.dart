import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:news_app/utils/app_error.dart';

class ApiService {
  static const baseURL = "https://inshorts.deta.dev/";

  Future<ParsedResponse> get(String path,
      {Map<String, String>? headers,
      Map<dynamic, dynamic>? params,
      bool needAuthentication = false}) async {
    var url = "";
    url = baseURL + path;
    url += _paramString(params);
    var uri = Uri.parse(url);

    return http.get(uri, headers: headers).then((http.Response response) {
      final String? res = response.body;
      final int code = response.statusCode;
      if (res == null || res.isEmpty) {
        if (code == 200) {
          throw AppError.emptyData;
        }
        throw AppError.serverError;
      } else {
        return ParsedResponse(code, res);
      }
    }).catchError((Object e) {

      throw AppError.noInternet;
    });
  }


  String _paramString(Map<dynamic, dynamic>? parameters) {
    if (parameters == null || parameters.isEmpty) {
      return "";
    }

    String paramsString = "";
    bool first = true;

    for (String key in parameters.keys) {
      if (first) {
        first = false;
        paramsString += "?";
      } else {
        paramsString += "&";
      }
      paramsString += key + "=" + parameters[key].toString();
    }
    return paramsString;
  }
}

class ParsedResponse {
  int code;
  String response;

  ParsedResponse(this.code, this.response);

  bool isOk() {
    return code == 200;
  }

  @override
  String toString() {
    return 'ParsedResponse{code : $code, response : " $response "}';
  }
}
