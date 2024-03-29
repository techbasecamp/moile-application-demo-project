import 'package:demo_project/assets/app_colors.dart';
import 'package:demo_project/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color color;
  const DefaultAppbar({
    Key? key,
    this.color = AppColor.blueBlack,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 56);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 56),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            tooltip: "Back",
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(
              Assets.backButton,
              color: color,
            ),
          ),
          iconTheme: IconThemeData(color: color),
        ),
      ),
    );
  }
}
