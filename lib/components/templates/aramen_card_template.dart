import 'package:demo_project/assets/app_styles.dart';
import 'package:demo_project/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ARamenCardTemplate extends StatelessWidget {
  const ARamenCardTemplate({Key? key, this.content}) : super(key: key);

  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(
              top: 150.h,
              left: Style.smallPadding,
              right: Style.smallPadding,
            ),
            width: double.infinity,
            height: 654.h,
            child: content,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(64.r),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 80.h),
          child: Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(
              Assets.ramen,
              width: double.infinity,
              height: 300.h,
            ),
          ),
        ),
      ],
    );
  }
}
