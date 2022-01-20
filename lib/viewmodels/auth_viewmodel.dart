import 'package:demo_project/assets/assets.dart';
import 'package:demo_project/components/widgets/default_progress_indicator.dart';
import 'package:demo_project/routes/app_pages.dart';
import 'package:demo_project/services/staff_service.dart';
import 'package:demo_project/utils/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  late final IStaffService _service;

  AuthViewModel(this._service);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  String get branchName => _service.branchName;
  GlobalKey<FormState> get formKey => _formKey;

  void onClickSignIn() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      Get.dialog(const DefaultProgressIndicator());
      try {
        await _service.login(username, password);
        Get.back();
        Get.toNamed(Routes.home);
      } catch (e) {
        Get.back();
        UIUtil()
            .showSnackBar("เกิดข้อผิดพลาด", e.toString(), Assets.aramenLogo2);
      }
    }
  }

  String? validateUsername(String? username) {
    if (username == null || username == "") {
      return "กรุณากรอกรหัสพนักงานของท่าน";
    } else {
      return null;
    }
  }

  String? validatePassword(String? password) {
    if (password == null || password == "") {
      return "กรุณากรอกรหัสผ่านของท่าน";
    } else if (password.length < 6) {
      return "รหัสผ่านต้องมีความยาวมากกว่า 6 ตัวอักษร";
    } else {
      return null;
    }
  }
}
