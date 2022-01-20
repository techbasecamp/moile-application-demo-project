import 'package:demo_project/assets/assets.dart';
import 'package:demo_project/components/widgets/default_progress_indicator.dart';
import 'package:demo_project/models/coupons/check_coupon_response.dart';
import 'package:demo_project/routes/app_pages.dart';
import 'package:demo_project/services/coupon_service.dart';
import 'package:demo_project/utils/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitCouponViewModel extends GetxController {
  late final ICouponService _service;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _qrcodeController = TextEditingController();
  final RxString _error = "".obs;

  SubmitCouponViewModel(this._service);

  get qrcodeController => _qrcodeController;
  get formKey => _formKey;
  get error => _error;

  void onFormChange(String value) {
    if (value.length != 8) {
      _error.value = "";
    }
  }

  void onClickSearchAgain() {
    _error.value = "";
    _qrcodeController.text = "";
  }

  void _setError(String message) {
    _error.value = message;
  }

  Future<void> onClickConfirm(bool isDialog) async {
    UIUtil ui = UIUtil();

    if (_formKey.currentState!.validate()) {
      if (_service.hasQrcode(_qrcodeController.text)) {
        ui.showSnackBar(
            "แจ้งเตือน", "ท่านได้เพิ่มคูปองดังกล่าวแล้ว", Assets.aramenLogo2);
      }

      Get.dialog(const DefaultProgressIndicator());
      CheckCouponResponse coupon;
      try {
        coupon = await _service.addCoupon(_qrcodeController.text);
        Get.back();

        if (coupon.validCoupon) {
          isDialog ? Get.back() : Get.offNamed(Routes.list);
        } else {
          _setError(coupon.validCoupon ? "" : coupon.messageTh);
        }
      } catch (e) {
        Get.back();
        ui.showSnackBar("แจ้งเตือน", e.toString(), Assets.aramenLogo2);
      }
    }
  }

  String? validateQrcode(String? qrcode) {
    if (qrcode == null || qrcode.length != 8) {
      return "กรุณากรอกรหัสคูปองให้ครบถ้วน";
    } else {
      return null;
    }
  }

  void clearCouponData() {
    _service.clearData();
  }
}
