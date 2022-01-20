import 'package:demo_project/data/network/base_api_service.dart';
import 'package:demo_project/data/network/network_api_service.dart';
import 'package:demo_project/repositories/coupon_repository.dart';
import 'package:demo_project/services/coupon_service.dart';
import 'package:demo_project/viewmodels/home_viewmodel.dart';
import 'package:demo_project/viewmodels/submit_coupon_viewmodel.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(_buildCouponService, fenix: true);
    Get.lazyPut(() => HomeViewModel(Get.find()));
    Get.lazyPut(() => SubmitCouponViewModel(Get.find()), fenix: true);
  }

  ICouponService _buildCouponService() {
    BaseApiService networkApiService = NetworkApiService();
    ICouponRepository couponRepository = CouponRepository(networkApiService);
    ICouponService couponService = CouponService(couponRepository);
    return couponService;
  }
}
