import 'package:demo_project/routes/app_pages.dart';
import 'package:demo_project/services/staff_service.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  late final IStaffService _service;

  HomeViewModel(this._service);

  String get branchName => _service.branchName;

  void logout() {
    _service.logout();
    Get.offAllNamed(Routes.login);
  }

  void onClickUseCoupon() {
    Get.toNamed(Routes.submit);
  }
}
