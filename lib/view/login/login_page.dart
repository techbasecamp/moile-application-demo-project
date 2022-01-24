import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_project/assets/app_colors.dart';
import 'package:demo_project/assets/app_styles.dart';
import 'package:demo_project/components/templates/aramen_card_template.dart';
import 'package:demo_project/components/widgets/default_button.dart';
import 'package:demo_project/viewmodels/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginViewModel> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.red,
      body: ARamenCardTemplate(
        content: LoginForm(),
      ),
    );
  }
}

class LoginButton extends GetView<LoginViewModel> {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultButton(
        title: "เข้าสู่ระบบ",
        onPressed: controller.onClickSignIn,
      ),
    );
  }
}

class LoginForm extends GetView<LoginViewModel> {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText("Login", style: Style.titleStyle),
          SizedBox(height: 50.h),
          AutoSizeText("รหัสพนักงาน", style: Style.formLabelStyle),
          TextInputForm(
              key: const Key("username"),
              validator: controller.validateUsername,
              controller: controller.usernameController,
              hideValue: false),
          SizedBox(height: 10.h),
          AutoSizeText("Password", style: Style.formLabelStyle),
          TextInputForm(
              key: const Key("password"),
              validator: controller.validatePassword,
              controller: controller.passwordController,
              hideValue: true),
          const Spacer(),
          const LoginButton(
            key: Key("login_button"),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class TextInputForm extends StatelessWidget {
  const TextInputForm({
    Key? key,
    required this.validator,
    required this.controller,
    required this.hideValue,
  }) : super(key: key);

  final String? Function(String? p1)? validator;
  final TextEditingController controller;
  final bool hideValue;

  @override
  Widget build(BuildContext context) {
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
