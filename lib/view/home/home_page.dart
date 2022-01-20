import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_project/assets/app_colors.dart';
import 'package:demo_project/assets/app_styles.dart';
import 'package:demo_project/assets/assets.dart';
import 'package:demo_project/components/templates/aramen_card_template.dart';
import 'package:demo_project/components/widgets/branch_title.dart';
import 'package:demo_project/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeViewModel> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppbar(),
      backgroundColor: AppColor.red,
      body: ARamenCardTemplate(content: _buildContent()),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        IconButton(
          tooltip: "Logout",
          onPressed: controller.logout,
          icon: const Icon(Icons.logout_outlined),
          iconSize: 35.0,
        )
      ],
    );
  }

  Column _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BranchTitle(branchName: controller.branchName),
        const Spacer(),
        _buildButton(
          text: "ใช้คูปอง",
          textColor: Colors.white,
          icon: _buildCouponIcon(),
          backgroundColor: AppColor.brightRed,
          overlayColor: AppColor.red,
          onPressed: controller.onClickUseCoupon,
        ),
        const Spacer(),
      ],
    );
  }

  SvgPicture _buildCouponIcon() {
    return SvgPicture.asset(
      Assets.couponLogo,
      color: Colors.white,
      width: 31.w,
    );
  }

  _buildButton({
    required String text,
    required Widget icon,
    required Color textColor,
    required VoidCallback onPressed,
    required Color backgroundColor,
    required Color overlayColor,
  }) {
    return OutlinedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: 30.h,
          ),
        ),
        side: MaterialStateProperty.all(BorderSide.none),
        shadowColor: MaterialStateProperty.all(Colors.black.withOpacity(.5)),
        overlayColor: MaterialStateProperty.all(overlayColor),
        elevation: MaterialStateProperty.all(4),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 0)),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 10),
          AutoSizeText(
            text,
            style: Style.buttonTextStyle.copyWith(
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}