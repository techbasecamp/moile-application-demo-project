import 'package:demo_project/models/coupons/check_coupon_response.dart';
import 'package:demo_project/models/coupons/use_coupon_response.dart';
import 'package:demo_project/repositories/coupon_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ICouponService {
  Rx<List<Menu>> get menuList;
  Rx<Map<String, int>> get qrcode;
  UseCouponResponse? get useCouponDetail;

  void removeMenu(String qrcode, String menuID);
  Future<CheckCouponResponse> addCoupon(String qrcode);
  Future<void> useCoupon();
  bool hasQrcode(String qrcode);
  void clearData();
}

class CouponService implements ICouponService {
  late final ICouponRepository _repository;

  final Rx<List<Menu>> _menus = Rx<List<Menu>>([]);
  final Rx<Map<String, int>> _qrcodes = Rx<Map<String, int>>({});

  UseCouponResponse? _useCouponDetail;

  CouponService(this._repository);

  @override
  Rx<List<Menu>> get menuList => _menus;

  @override
  Rx<Map<String, int>> get qrcode => _qrcodes;

  @override
  UseCouponResponse? get useCouponDetail => _useCouponDetail;

  @override
  void removeMenu(String qrcode, String menuID) {
    int? oldMenuNumber = _qrcodes.value[qrcode];

    _qrcodes.update((qrcodes) {
      if (oldMenuNumber == null || oldMenuNumber <= 1) {
        qrcodes!.remove(qrcode);
      } else {
        qrcodes![qrcode] = oldMenuNumber - 1;
      }
    });

    _menus.update((menus) {
      menus!.removeWhere((menu) {
        return menu.freeMenuId == menuID && menu.qrcode == qrcode;
      });
    });
  }

  @override
  Future<CheckCouponResponse> addCoupon(String qrcode) async {
    CheckCouponResponse? coupon;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("TOKEN");

    coupon = await _repository.checkCoupon(token!, qrcode);
    if (coupon.validCoupon) {
      _addCouponList(coupon, qrcode);
    }

    return coupon;
  }

  void _addCouponList(CheckCouponResponse coupon, String qrcode) {
    int? oldMenuNumber = _qrcodes.value[qrcode];

    _qrcodes.update((qrcodes) {
      qrcodes![qrcode] = oldMenuNumber ?? 0 + coupon.menu.length;
    });

    _menus.update((menus) {
      menus!.addAll(coupon.menu);
    });
  }

  @override
  Future<void> useCoupon() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("TOKEN");

    _useCouponDetail = await _repository.useCoupon(
      token!,
      _qrcodes.value.keys.toList(),
      _menus.value,
    );
  }

  @override
  bool hasQrcode(String qrcode) {
    return _qrcodes.value.containsKey(qrcode);
  }

  @override
  void clearData() {
    _menus.value.clear();
    _qrcodes.value.clear();
    _useCouponDetail = null;
  }
}
