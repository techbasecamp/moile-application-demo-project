import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_project/assets/app_colors.dart';
import 'package:demo_project/assets/assets.dart';
import 'package:demo_project/components/widgets/default_button.dart';
import 'package:demo_project/viewmodels/submit_coupon_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SummitCouponForm extends GetView<SubmitCouponViewModel> {
  final Color? errorColor;
  final bool isDialog;

  final TextStyle _formStyle = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
  );

  final TextStyle _textStyle = TextStyle(
    fontSize: 15.sp,
  );

  SummitCouponForm({Key? key, this.errorColor, required this.isDialog})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 570.h,
          width: double.infinity,
          child: Image.asset(
            Assets.couponBackground,
            fit: BoxFit.fill,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UseCouponCardContent(formStyle: _formStyle),
            SizedBox(height: 120.h),
            _buildNotFoundHelper(),
            const Spacer(),
            UseCouponSubmitButton(
              isDialog: isDialog,
              key: const Key("Usecoupon_button"),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }

  _buildNotFoundHelper() {
    return Obx(
      () => controller.error.value == ""
          ? const SizedBox()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  controller.error.value,
                  style: _textStyle.copyWith(
                    color: errorColor ?? Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: controller.onClickSearchAgain,
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.question),
                      const SizedBox(width: 5),
                      AutoSizeText(
                        "ค้นหาคูปองใหม่อีกครั้ง",
                        style: _textStyle.copyWith(
                          color: errorColor ?? AppColor.brightRed,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class UseCouponSubmitButton extends GetView<SubmitCouponViewModel> {
  const UseCouponSubmitButton({
    Key? key,
    required this.isDialog,
  }) : super(key: key);

  final bool isDialog;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 60.w),
        child: DefaultButton(
          title: "ยืนยัน",
          onPressed: () {
            controller.onClickConfirm(isDialog);
          },
        ),
      );
}

class UseCouponCardContent extends GetView<SubmitCouponViewModel> {
  const UseCouponCardContent({
    Key? key,
    required TextStyle formStyle,
  })  : _formStyle = formStyle,
        super(key: key);

  final TextStyle _formStyle;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          left: 80.w,
          right: 80.w,
          top: 80.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset(
                Assets.couponLogo,
                width: 108.w,
              ),
            ),
            SizedBox(height: 50.h),
            AutoSizeText(
              "ค้นหาคูปอง",
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            AutoSizeText(
              "กรอกรหัส 8 หลัก เพื่อใช้คูปอง",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w300,
              ),
              maxLines: 2,
            ),
            SizedBox(height: 20.h),
            const AutoSizeText("Number"),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Form(
                key: controller.formKey,
                child: TextFormField(
                  key: const Key("usecoupon_textfield"),
                  maxLength: 8,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  cursorColor: AppColor.brightRed,
                  controller: controller.qrcodeController,
                  validator: controller.validateQrcode,
                  onChanged: controller.onFormChange,
                  style: _formStyle,
                  decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.brightRed,
                      ),
                    ),
                    hintStyle: _formStyle.copyWith(
                      color: Colors.black.withOpacity(.1),
                    ),
                    hintText: "12345678",
                    counterText: "",
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
