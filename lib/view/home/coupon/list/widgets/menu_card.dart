import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_project/assets/app_colors.dart';
import 'package:demo_project/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'coupon_title.dart';

class MenuCard extends StatelessWidget {
  final RxBool isSlide;
  final String menuName;
  final int quantity;

  final TextUtil textUtil = TextUtil();

  MenuCard({
    Key? key,
    required this.isSlide,
    required this.menuName,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(width: 40.w),
          Expanded(
            child: Obx(
              () => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.r),
                    bottomLeft: Radius.circular(14.r),
                  ),
                  color: isSlide.value == true
                      ? const Color(0xFFF5F5F5)
                      : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildMenuImage(),
                    SizedBox(width: 25.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CouponTitle(menu: menuName, fontSize: 20.sp),
                        AutoSizeText(
                          "${textUtil.formatNumber(quantity, limit: 999)} ชาม",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF848484),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildMenuImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: AppColor.greyMenuBackground,
        boxShadow: [
          BoxShadow(
            offset: const Offset(3, 3),
            blurRadius: 7,
            spreadRadius: 1,
            color: AppColor.boxShadow.withOpacity(.2),
          ),
        ],
        image: const DecorationImage(
          image: AssetImage("assets/images/mock_menu.png"),
        ),
      ),
      width: 110.w,
      height: 95.h,
    );
  }
}
