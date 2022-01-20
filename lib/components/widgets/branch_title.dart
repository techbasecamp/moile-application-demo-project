import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_project/assets/app_colors.dart';
import 'package:demo_project/assets/app_styles.dart';
import 'package:demo_project/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:demo_project/utils/text.dart';
import 'package:get/get.dart';

class BranchTitle extends StatelessWidget {
  final String branchName;
  final TextUtil textUtil = TextUtil();

  BranchTitle({Key? key, required this.branchName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutoSizeText("A Ramen", style: Style.titleStyle),
        SizedBox(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.pinLogo),
            const SizedBox(width: 10),
            Obx(
              () => AutoSizeText(
                textUtil.handleOverflow(branchName, 35),
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
