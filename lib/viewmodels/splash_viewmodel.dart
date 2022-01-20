import 'package:demo_project/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPageController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("TOKEN");

    if (token == null) {
      return Get.offNamed(Routes.login);
    } else {
      return Get.offNamed(Routes.home);
    }
  }
}
