import 'dart:convert';
import 'package:news_app/modules/home_module/model/News.dart';
import 'package:news_app/services/api_service.dart';
import 'package:news_app/utils/app_error.dart';

class HomeScreenService extends ApiService {
  static const getAllNews = "news?category=all";

  Future<News> getNewsList() async {
    var headers = <String, String>{};
    headers["Content-Type"] = "application/json";

    var apiPath = getAllNews;

    Future<ParsedResponse> future = get(
      apiPath,
      headers: headers,
      needAuthentication: true,
    );
    return future.then((ParsedResponse res) async {
      if (res.isOk()) {
        try {
          var response = json.decode(res.response);

          News news = News.fromJson(response);
          return news;
        } catch (e) {
          throw AppError.serverError;
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
