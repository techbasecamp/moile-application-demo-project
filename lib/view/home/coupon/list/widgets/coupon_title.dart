import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_project/assets/app_colors.dart';
import 'package:demo_project/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponTitle extends StatelessWidget {
  final String menu;
  final double fontSize;

  const CouponTitle({
    Key? key,
    required this.menu,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AutoSizeText(
          "ฟรี!",
          style: TextStyle(
            color: AppColor.brightRed,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 5.w),
        AutoSizeText(
          TextUtil.handleOverflow(menu, 15),
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.clip,
        ),
      ],
    );
  }
}
