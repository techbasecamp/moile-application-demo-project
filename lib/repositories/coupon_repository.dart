import 'package:demo_project/data/network/api_end_points.dart';
import 'package:demo_project/data/network/base_api_service.dart';
import 'package:demo_project/models/coupons/check_coupon_response.dart';
import 'package:demo_project/models/coupons/use_coupon_response.dart';

abstract class ICouponRepository {
  Future<CheckCouponResponse> checkCoupon(String token, String qrcode);
  Future<UseCouponResponse> useCoupon(
      String token, List<String> qrcodes, List<Menu> menus);
}

class CouponRepository extends ICouponRepository {
  late final BaseApiService _apiService;

  CouponRepository(this._apiService);

  @override
  Future<CheckCouponResponse> checkCoupon(String token, String qrcode) async {
    try {
      var response = await _apiService.postResponse(
        ApiEndPoints.checkQRCode,
        {
          "qrcode": qrcode,
          "coupon_type": "แถมฟรี",
          "order_channel": "E",
        },
        token: token,
      );
      return CheckCouponResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UseCouponResponse> useCoupon(
      String token, List<String> qrcodes, List<Menu> menus) async {
    try {
      var response = await _apiService.postResponse(
        ApiEndPoints.useCoupon,
        {
          "qrcode": qrcodes,
          "menu": menus.map((i) => i.toJson()).toList(),
        },
        token: token,
      );
      return UseCouponResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
