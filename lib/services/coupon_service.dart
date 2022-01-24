import 'package:demo_project/assets/constants.dart';
import 'package:demo_project/data/local/base_local_storage.dart';
import 'package:demo_project/models/coupons/check_coupon_response.dart';
import 'package:demo_project/models/coupons/use_coupon_response.dart';
import 'package:demo_project/repositories/coupon_repository.dart';
import 'package:get/get.dart';

abstract class ICouponService {
  List<Menu> get menus;
  Map<String, int> get qrcodes;
  UseCouponResponse? get useCouponDetail;

  void removeMenu(String qrcode, String menuID);
  Future<CheckCouponResponse> addCoupon(String qrcode);
  Future<void> useCoupon();
  bool hasQrcode(String qrcode);
  void clearData();
}

class CouponService extends GetxService implements ICouponService {
  List<Menu> _menus = [];
  Map<String, int> _qrcodes = {};

  late final ICouponRepository _repository;
  late final BaseLocalStorage _storage;

  UseCouponResponse? _useCouponDetail;

  CouponService(this._repository, this._storage);

  @override
  void onInit() {
    super.onInit();
    _menus = [];
    _qrcodes = {};
  }

  @override
  List<Menu> get menus => _menus;

  @override
  Map<String, int> get qrcodes => _qrcodes;

  @override
  UseCouponResponse? get useCouponDetail => _useCouponDetail;

  @override
  void removeMenu(String qrcode, String menuID) {
    int? oldMenuNumber = _qrcodes[qrcode];

    if (oldMenuNumber == null || oldMenuNumber <= 1) {
      _qrcodes.remove(qrcode);
    } else {
      _qrcodes[qrcode] = oldMenuNumber - 1;
    }

    _menus.removeWhere((menu) {
      return menu.freeMenuId == menuID && menu.qrcode == qrcode;
    });
  }

  @override
  Future<CheckCouponResponse> addCoupon(String qrcode) async {
    String? token = await _storage.getString(Constant.token);

    CheckCouponResponse coupon = await _repository.checkCoupon(token!, qrcode);

    if (coupon.validCoupon) {
      _addCouponList(coupon, qrcode);
    }

    return coupon;
  }

  void _addCouponList(CheckCouponResponse coupon, String qrcode) {
    int? oldMenuNumber = _qrcodes[qrcode];
    _qrcodes[qrcode] = oldMenuNumber ?? 0 + coupon.menu.length;
    _menus.addAll(coupon.menu);
  }

  @override
  Future<void> useCoupon() async {
    String? token = await _storage.getString(Constant.token);

    _useCouponDetail = await _repository.useCoupon(
      token!,
      _qrcodes.keys.toList(),
      _menus,
    );
  }

  @override
  bool hasQrcode(String qrcode) {
    return _qrcodes.containsKey(qrcode);
  }

  @override
  void clearData() {
    _menus.clear();
    _qrcodes.clear();
    _useCouponDetail = null;
  }
}
