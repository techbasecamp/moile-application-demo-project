import 'dart:async';

import 'package:demo_project/assets/assets.dart';
import 'package:demo_project/components/widgets/complete_dialog.dart';
import 'package:demo_project/components/widgets/default_progress_indicator.dart';
import 'package:demo_project/models/coupons/check_coupon_response.dart';
import 'package:demo_project/routes/app_pages.dart';
import 'package:demo_project/services/coupon_service.dart';
import 'package:demo_project/utils/ui.dart';
import 'package:demo_project/view/home/coupon/list/widgets/submit_coupon_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponListViewModel extends GetxController {
  late final ICouponService _service;

  late final StreamSubscription<List<Menu>> _listener;
  late int _currentLastIndex;

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final Rx<List<Menu>> _menus = Rx<List<Menu>>([]);
  final Rx<Map<String, int>> _qrcodes = Rx<Map<String, int>>({});

  CouponListViewModel(this._service);

  GlobalKey<AnimatedListState> get listKey => _listKey;
  int get couponNumber => _qrcodes.value.keys.length;
  int get initCount => _menus.value.length + 1;
  Menu getMenu(int index) => _menus.value[index - 1];

  @override
  void onInit() {
    super.onInit();
    _menus.value = _service.menus;
    _qrcodes.value = _service.qrcodes;
    _currentLastIndex = initCount - 1;
    _listener = _menus.listen(_listenMenuList);
  }

  @override
  void onClose() {
    super.onClose();
    _listener.cancel();
  }

  void _updateQrcodes() {
    _qrcodes.update((qrcodes) {
      qrcodes = _service.qrcodes;
    });
  }

  void _updateMenus() {
    _menus.update((menus) {
      menus = _service.menus;
    });
  }

  void onDeleteMenu(
    int index,
    String menuID,
    String qrcode,
    Widget Function(BuildContext, Animation<double>) builder,
  ) {
    _service.removeMenu(qrcode, menuID);
    _listKey.currentState!.removeItem(
      index,
      builder,
      duration: const Duration(milliseconds: 200),
    );
    _updateMenus();
    _updateQrcodes();
  }

  void _listenMenuList(List<Menu> menuList) {
    if (_currentLastIndex < menuList.length) {
      for (int i = _currentLastIndex + 1; i <= menuList.length; i++) {
        _listKey.currentState!.insertItem(i);
      }
    }
    _currentLastIndex = menuList.length;
  }

  void onClickConfirmCoupon() async {
    UIUtil ui = UIUtil();

    if (_qrcodes.value.isEmpty) {
      ui.showSnackBar(
        "แจ้งเตือน",
        "ต้องมีอย่างน้อย 1 คูปอง",
        Assets.aramenLogo2,
      );
      return;
    }

    Get.dialog(const DefaultProgressIndicator());

    try {
      await _service.useCoupon();
      Get.back();
      Get.offNamed(Routes.complete);
      Get.dialog(const CompleteDialog());
    } catch (e) {
      Get.back();
      ui.showSnackBar(
        "เกิดข้อผิดพลาด",
        e.toString(),
        Assets.aramenLogo2,
      );
    }
  }

  void onClickAddCoupon() async {
    await Get.dialog(const SubmitCouponDialog());
    _updateMenus();
    _updateQrcodes();
  }
}
