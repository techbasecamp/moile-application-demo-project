import 'package:demo_project/assets/app_colors.dart';
import 'package:demo_project/assets/app_styles.dart';
import 'package:demo_project/assets/assets.dart';
import 'package:demo_project/components/widgets/default_appbar.dart';
import 'package:demo_project/components/widgets/default_button.dart';
import 'package:demo_project/utils/text.dart';
import 'package:demo_project/view/home/coupon/list/widgets/coupon_header.dart';
import 'package:demo_project/view/home/coupon/list/widgets/coupon_title.dart';
import 'package:demo_project/view/home/coupon/list/widgets/curves_card.dart';
import 'package:demo_project/viewmodels/complete_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/coupon_detail.dart';

class CompletePage extends GetView<CompleteViewModel> {
  const CompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(color: Colors.white),
      backgroundColor: AppColor.brightRed,
      body: Stack(
        children: [
          Column(
            children: [
              CouponHeader(
                title: "ใช้คูปองสำเร็จ",
                couponNumber: controller.couponNumber,
              ),
              CurvesCard(child: const CardContent()),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 127.h, right: 20.w),
            child: Align(
              alignment: Alignment.topRight,
              child:
                  SvgPicture.asset(Assets.correct, width: 50.w, height: 50.h),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 40.h,
              right: Style.smallPadding,
              left: Style.smallPadding,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: DefaultButton(
                title: "เสร็จสิ้น",
                onPressed: controller.onClickComplete,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.name,
    required this.quantity,
  }) : super(key: key);

  final String name;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      padding: EdgeInsets.only(bottom: 15.h),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFCCCCCC), width: .7),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 30,
            child: Image.asset("assets/images/mock_menu.png"),
          ),
          Expanded(
            flex: 50,
            child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: CouponTitle(menu: name, fontSize: 17.sp)),
          ),
          Expanded(
            flex: 20,
            child: Text(
              TextUtil.formatNumber(quantity, limit: 999) + " ชาม",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF848484),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardContent extends GetView<CompleteViewModel> {
  const CardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Style.smallPadding,
        right: Style.smallPadding,
        top: 50.h,
      ),
      child: Column(
        children: [
          CouponDetail(
            customerName: controller.customerName,
            date: controller.date,
            ref: controller.refcode,
            time: controller.time,
          ),
          Container(
            width: double.infinity,
            color: AppColor.red,
            height: 2,
            margin: EdgeInsets.only(top: 35.h),
          ),
          const CardList(),
        ],
      ),
    );
  }
}

class CardList extends GetView<CompleteViewModel> {
  const CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.orders.length + 1,
        itemBuilder: (context, index) {
          return index == 0
              ? SizedBox(height: 20.h)
              : CardItem(
                  name: controller.getOrder(index - 1).menuName,
                  quantity: controller.getOrder(index - 1).quantity,
                );
        },
      ),
    );
  }
}
