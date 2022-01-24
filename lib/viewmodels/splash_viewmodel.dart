import 'package:demo_project/routes/app_pages.dart';
import 'package:demo_project/services/staff_service.dart';
import 'package:get/get.dart';

class SplashViewModel extends GetxController {
  late final IStaffService _service;

  SplashViewModel(this._service);

  Future<void> init() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      await _service.fetchInfo();
      return Get.offNamed(Routes.home);
    } catch (e) {
      return Get.offNamed(Routes.login);
    }
  }

  @override
  void onReady() async {
    await init();
    super.onReady();
  }
}
