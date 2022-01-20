import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_project/assets/app_colors.dart';
import 'package:demo_project/assets/app_styles.dart';
import 'package:demo_project/components/templates/aramen_card_template.dart';
import 'package:demo_project/components/widgets/default_button.dart';
import 'package:demo_project/viewmodels/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<AuthViewModel> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.red,
      body: ARamenCardTemplate(
        content: _buildContent(),
      ),
    );
  }

  Form _buildContent() {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText("Login", style: Style.titleStyle),
          SizedBox(height: 50.h),
          AutoSizeText("รหัสพนักงาน", style: Style.formLabelStyle),
          _buildForm(
            controller.validateUsername,
            controller.usernameController,
            false,
          ),
          SizedBox(height: 10.h),
          AutoSizeText("Password", style: Style.formLabelStyle),
          _buildForm(
            controller.validatePassword,
            controller.passwordController,
            true,
          ),
          const Spacer(),
          _buildButton(),
          const Spacer(),
        ],
      ),
    );
  }

  Center _buildButton() {
    return Center(
      child: DefaultButton(
        title: "เข้าสู่ระบบ",
        onPressed: controller.onClickSignIn,
      ),
    );
  }

  Container _buildForm(
    String? Function(String?)? validator,
    TextEditingController controller,
    bool hideValue,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: TextFormField(
        style: Style.formInput,
        cursorColor: AppColor.red,
        decoration: Style.formInputDecoration,
        validator: validator,
        controller: controller,
        obscureText: hideValue,
      ),
    );
  }
}
