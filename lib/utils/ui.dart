import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UIUtil {
  void showSnackBar(String title, String message, String image) {
    if (Get.isSnackbarOpen) return;

    Get.rawSnackbar(
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40.w),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      borderRadius: 20.r,
      titleText: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
        ),
      ),
      messageText: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          message,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17.sp),
        ),
      ),
      icon: SvgPicture.asset(image, width: 40, height: 40),
    );
  }
}
