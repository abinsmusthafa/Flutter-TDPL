import 'dart:io';
import 'package:get/get.dart';
import 'package:new_version/new_version.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shipyard_customer_mobile/modules/cart/cart_service.dart';
import 'package:shipyard_customer_mobile/modules/cart/controller/cart_screen_controller.dart';
import 'package:shipyard_customer_mobile/modules/home/controller/home_screen_controller.dart';
import 'package:shipyard_customer_mobile/modules/home/model/company_parameter.dart';
import 'package:shipyard_customer_mobile/modules/navigation_bar/controller/nav_controller.dart';
import 'package:shipyard_customer_mobile/modules/search/model/SearchModel.dart';
import 'package:shipyard_customer_mobile/modules/search/service/search_service.dart';
import 'package:shipyard_customer_mobile/modules/splash/services/splash_service.dart';
import 'package:shipyard_customer_mobile/utils/app_error.dart';
import 'package:shipyard_customer_mobile/utils/check_internet.dart';
import 'package:shipyard_customer_mobile/utils/retry_snack_bar.dart';
import 'package:shipyard_customer_mobile/utils/session_manager.dart';
import 'package:version/version.dart';


class SplashScreenController extends GetxController {
  static final SplashScreenController _singleton = SplashScreenController._internal();

  factory SplashScreenController() {
    return _singleton;
  }


  SplashScreenController._internal();

  final Rx<AppError> errors = AppError(null, null).obs;
  var isLoading = false.obs;
  List<String> categoryList = <String>[].obs;
  var isAcceptedAlcoholWarning = "".obs;
  var appCurrentVersion = "".obs;
  static final SessionManager prefs = SessionManager();
  Map<String, StoreParameter> companyParameter = <String, StoreParameter>{}.obs;
  Rx<bool> isAlreadySelectedLanguage = false.obs;

  @override
  onInit() async {
    if(isAcceptedAlcoholWarning.value.isEmpty){
      await getAlcoholFlag();
    }
    checkPackageInfo();
    super.onInit();
  }

  Future<bool> getAlcoholCategory() async {
if(isAcceptedAlcoholWarning.value == "true") {
  return true;
}

    bool isOnline = await CheckInternet().verifyOnline();
    if (!isOnline) {
      RetrySnackBar().showErrorSnackBar("No internet", "Please check your connection", getAlcoholCategory);
      errors(AppError.noInternet);
      return false;
    }
    isLoading(true);
    try {
      updateUI();
      String category = await SplashScreenService().getAlcoholCategory();
      List<String> categoryList = (category.split(','));
      this.categoryList?.assignAll(categoryList);
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

  Future<bool> fetchCompanyParameter() async {
    bool isOnline = await CheckInternet().verifyOnline();
    if (!isOnline) {
      RetrySnackBar().showErrorSnackBar("No internet", "Please check your connection",onInit);
      errors(AppError.noInternet);
      return false;
    }
    try {
      Map<String, StoreParameter> storeParameter =   await SplashScreenService().getCompanyParameter();
      HomeScreenController().companyParameter = storeParameter;

      List<String> navTabs = ((HomeScreenController().companyParameter["cognetry.super.company.menu"]?.value ?? "").split(','));
      NavController().navTabsStrings = navTabs;
      NavController().setUpNavBar();
      companyParameter = storeParameter;
      updateUI();
      return true;
    } catch (e) {
      companyParameter = <String, StoreParameter>{};
      return false;
    }
  }

  Future<String?> setAlcoholFlag(String flag) async {
    String? tmpEmail = await SessionManager().setString(flag, "alcoholFlag");
    if (tmpEmail != null && (tmpEmail.isNotEmpty)) {
      isAcceptedAlcoholWarning.value = tmpEmail;
    }
    return tmpEmail;
  }

  Future<String?> getAlcoholFlag() async {
    String? tmpEmail = await prefs.getString("alcoholFlag");
    if (tmpEmail != null && (tmpEmail.isNotEmpty)) {
      isAcceptedAlcoholWarning.value = tmpEmail;
    }
    return tmpEmail;
  }

  void checkPackageInfo() async {
    PackageInfo.fromPlatform().then((packageInfo) {
      if (packageInfo.version.isNotEmpty) {
        appCurrentVersion.value = packageInfo.version;
      }
    });
  }

  /// compare Current Version With Downloadable MinVersion
  isShowForceUpdate() {
    Version currentVersion = Version.parse(appCurrentVersion.value);
    Version minVersion =
        Version.parse((HomeScreenController().companyParameter["cognetry.super.company.downloadable_min_version"]?.value ?? "0.0.0"));

    if ((currentVersion >= minVersion)) {
      return false;
    }

    return true;
  }

  navigateToStore() async {
    NewVersion version = NewVersion(iOSId: 'ai.cli.craftconcierge', androidId: 'ai.cli.craftconcierge',);
    if (Platform.isAndroid) {
      version.launchAppStore("https://play.google.com/store/apps/details?id=ai.cli.craftconcierge");
      return;
    }
    version.getVersionStatus().then((packageInfo) {
      version.launchAppStore(packageInfo?.appStoreLink ?? "");
    });
  }

  updateUI() {
    update();
  }
}