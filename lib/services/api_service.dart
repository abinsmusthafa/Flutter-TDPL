import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:shipyard_customer_mobile/modules/login/controller/login_controller.dart';
import 'package:shipyard_customer_mobile/utils/app_error.dart';

/// This class is use common for API calls  get,post,update,delete etc

class ApiService {
  static const baseURL = "https://cicd.cognetrylabsdemo.com"; // will change the URL.
  // static const baseURL = "https://www.craftconcierge.shop"; // production
  // static const baseURL = "https://uat.cognetrylabsdemo.com"; // will change the URL.

String getBaseURL() {
  return baseURL;
}

  Future<ParsedResponse> get(String path,
      {Map<String, String>? headers,
      Map<dynamic, dynamic>? params,
      bool needAuthentication = false}) async {
    var url = "";
    url = baseURL + path;
    url += _paramString(params);
    var uri = Uri.parse(url);
    if (needAuthentication) {
      headers?['authorization'] = "Bearer " + await LoginController().userToken();
    }
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
      if (e is AppError) {
        if (e.code == 405) {
          throw AppError.emptyData;
        }
      }
      throw AppError.noInternet;
    });
  }


  /// Use to call non Cognetry base url Apis
  Future<ParsedResponse> getNonCognetryData(String path,
      {Map<String, String>? headers,
        Map<dynamic, dynamic>? params,
        bool needAuthentication = false}) async {
    var url = "";
    url = path;
    url += _paramString(params);
    var uri = Uri.parse(url);
    if (needAuthentication) {
      headers?['authorization'] = "Bearer " + await LoginController().userToken();
    }
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
      if (e is AppError) {
        if (e.code == 405) {
          throw AppError.emptyData;
        }
      }
      throw AppError.noInternet;
    });
  }

  Future<ParsedResponse> post(String path,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      encoding,
      bool needAuthentication = false}) async {
    var url = "";
    url = baseURL + path;
    var uri = Uri.parse(url);

    if (needAuthentication == true) {
      headers?['Authorization'] = "Bearer " + await LoginController().userToken();
    }

    return http
        .post(uri,
            body: json.encode(body), headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String? res = response.body;
      final int code = response.statusCode;
      if (path == "/capturePageEvents" && response.statusCode == 200) {
        return ParsedResponse(code, res ?? "");
      }
      if (res == null || res.isEmpty) {
        throw AppError.serverError;
      } else {
        return ParsedResponse(code, res);
      }
    }).catchError((Object e) {
      throw AppError.noInternet;
    });
  }

  Future<ParsedResponse> post2(String path,
      {Map<String, String>? headers,
        List<Map<String, dynamic>>? body,
        encoding,
        bool needAuthentication = false}) async {
    var url = "";
    url = baseURL + path;
    var uri = Uri.parse(url);

    if (needAuthentication == true) {
      headers?['Authorization'] = "Bearer " + await LoginController().userToken();
    }

    return http
        .post(uri,
        body: json.encode(body), headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String? res = response.body;
      final int code = response.statusCode;

      if (res == null || res.isEmpty) {
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
