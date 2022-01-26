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
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(),
      backgroundColor: AppColor.red,
      body: ARamenCardTemplate(content: HomePageContent()),
    );
  }
}

class HomePageContent extends GetView<HomeViewModel> {
  const HomePageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BranchTitle(branchName: controller.branchName),
        const Spacer(),
        MenuButton(
          key: const Key("usecoupon"),
          text: "ใช้คูปอง",
          textColor: Colors.white,
          icon: SvgPicture.asset(
            Assets.couponLogo,
            color: Colors.white,
            width: 31.w,
          ),
          backgroundColor: AppColor.brightRed,
          overlayColor: AppColor.red,
          onPressed: controller.onClickUseCoupon,
        ),
        const Spacer(),
      ],
    );
  }
}

class CustomAppbar extends GetView<HomeViewModel> with PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}

class MenuButton extends StatelessWidget {
  const MenuButton(
      {Key? key,
      required this.onPressed,
      required this.backgroundColor,
      required this.overlayColor,
      required this.icon,
      required this.text,
      required this.textColor})
      : super(key: key);
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color overlayColor;
  final Widget icon;
  final String text;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
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
