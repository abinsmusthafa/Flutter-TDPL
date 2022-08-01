import 'dart:convert';
import 'package:shipyard_customer_mobile/modules/home/model/company_parameter.dart';
import 'package:shipyard_customer_mobile/modules/search/model/SearchModel.dart';
import 'package:shipyard_customer_mobile/services/api_service.dart';
import 'package:shipyard_customer_mobile/utils/app_error.dart';

class SplashScreenService extends ApiService {
  static const alcoholCategory = "/superinventory/get/alcohol/categories/inventory/SUPER_COMPANY_1";
  static const companyParameter = "/superorder/parameter/SUPER_COMPANY_1/get";


  Future<String> getAlcoholCategory() async {
    var headers = <String, String>{};
    headers["Content-Type"] = "application/json";

    var apiPath = alcoholCategory;


    Future<ParsedResponse> future = get(
      apiPath,
      headers: headers,
      needAuthentication: true,
    );
    return future.then((ParsedResponse res) async {
      if (res.isOk()) {
        try {
         return res.response;
        } catch (e) {
          throw AppError.internalError;
        }
      } else {
        final Map errorResponse = json.decode(res.response);
        throw AppError.serverError;
      }
    }).catchError((Object error) {
      throw error;
    });
  }

  Future<Map<String, StoreParameter>> getCompanyParameter() async {
    var headers = <String, String>{};
    var params = <String, String>{};
    headers["Content-Type"] = "application/json";
    var apiPath = companyParameter;
    Future<ParsedResponse> future = get(
      apiPath ,
      params: params,
      headers: headers,
      needAuthentication: true,
    );
    return future.then((ParsedResponse res) async {
      if (res.isOk()) {
        try {
          Map<String, StoreParameter>  storeParameter = storeParameterFromJson(res.response);
          return storeParameter;
        } catch (e) {
          throw AppError.internalError;
        }
      } else {
        final Map errorResponse = json.decode(res.response);
        throw AppError.serverError;
      }
    }).catchError((Object error) {
      throw error;
    });
  }

}