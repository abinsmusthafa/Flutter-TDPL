import 'package:get/get.dart';
import 'package:news_app/modules/home_module/model/News.dart';
import 'package:news_app/modules/home_module/services/home_service.dart';
import 'package:news_app/utils/app_error.dart';
import 'package:news_app/utils/check_internet.dart';

class HomeScreenController extends GetxController {
  static final HomeScreenController _singleton = HomeScreenController._internal();

  factory HomeScreenController() {
    return _singleton;
  }

  HomeScreenController._internal();

  final Rx<AppError> errors = AppError(null, null).obs;
  var isLoading = false.obs;

  List<Data>? newsList = <Data>[].obs;

  @override
  onInit() async {
    getNewsList();
    super.onInit();
  }

  Future<bool> getNewsList() async {
    bool isOnline = await CheckInternet().verifyOnline();
    if (!isOnline) {
      errors(AppError.noInternet);
      return false;
    }
    isLoading(true);
    try {
      updateUI();
      News news = await HomeScreenService().getNewsList();
      newsList = news.data;
      isLoading(false);
      updateUI();
      return true;
    } catch (e) {
      isLoading(false);
      updateUI();
      errors(AppError.noInternet);
      return false;
    }
  }

  updateUI() {
    update();
  }
}
