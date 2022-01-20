import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class Style {
  static TextStyle titleStyle = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle subtitleStyle = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle formLabelStyle = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle formInput = TextStyle(
    fontSize: 20.sp,
    color: const Color(0xFF35393E),
  );

  static TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle labelStyle = TextStyle(
    fontSize: 14.sp,
    color: AppColor.lightGrey,
  );

  static double smallPadding = 30.w;

  static InputDecoration formInputDecoration = InputDecoration(
    filled: true,
    border: InputBorder.none,
    fillColor: const Color(0xFFF5F5F5),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(25.7),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(25.7),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColor.brightRed),
      borderRadius: BorderRadius.circular(25.7),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColor.brightRed),
      borderRadius: BorderRadius.circular(25.7),
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: Style.smallPadding,
      vertical: 20.h,
    ),
  );
}
