import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_project/assets/app_styles.dart';
import 'package:demo_project/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponHeader extends StatelessWidget {
  final String title;
  final int couponNumber;

  const CouponHeader({
    Key? key,
    required this.title,
    required this.couponNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      margin: EdgeInsets.symmetric(vertical: 50.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            "รายการใช้คูปอง",
            style: Style.titleStyle.copyWith(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: AutoSizeText(
              "${TextUtil.formatNumber(couponNumber, limit: 999)} คูปอง",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
