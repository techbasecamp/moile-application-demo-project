import 'package:demo_project/assets/app_styles.dart';
import 'package:demo_project/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompleteDialog extends StatelessWidget {
  const CompleteDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: Style.smallPadding,
      ),
      child: AspectRatio(
        aspectRatio: 355 / 233,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40.r),
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.correct,
                width: 100.w,
                height: 100.h,
              ),
              SizedBox(height: 10.h),
              const Text(
                "ยืนยันการใช้คูปองสำเร็จ",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
