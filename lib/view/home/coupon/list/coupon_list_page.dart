import 'package:demo_project/assets/app_colors.dart';
import 'package:demo_project/assets/assets.dart';
import 'package:demo_project/components/widgets/default_appbar.dart';
import 'package:demo_project/components/widgets/default_button.dart';
import 'package:demo_project/models/coupons/check_coupon_response.dart';
import 'package:demo_project/viewmodels/coupon_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'widgets/coupon_header.dart';
import 'widgets/curves_card.dart';
import 'widgets/menu_card.dart';

class CouponListPage extends GetView<CouponListViewModel> {
  const CouponListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: const DefaultAppbar(color: Colors.white),
        backgroundColor: AppColor.brightRed,
        body: Stack(
          children: [
            Column(
              children: [
                Obx(
                  () {
                    return CouponHeader(
                      title: "รายการใช้คูปอง",
                      couponNumber: controller.couponNumber,
                    );
                  },
                ),
                CurvesCard(child: const MenuList()),
              ],
            ),
            const ButtonRow(),
          ],
        ),
      ),
    );
  }
}

class DeleteSlider extends GetView<CouponListViewModel> {
  const DeleteSlider({
    Key? key,
    required this.index,
    required this.menuID,
    required this.qrcode,
  }) : super(key: key);

  final int index;
  final String menuID;
  final String qrcode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: IconSlideAction(
        iconWidget: SvgPicture.asset(
          Assets.delete,
          width: 30,
        ),
        color: AppColor.brightRed,
        onTap: () {
          controller.onDeleteMenu(
            index,
            menuID,
            qrcode,
            (context, animation) => SizeTransition(
              axis: Axis.vertical,
              sizeFactor: animation,
              child: SizedBox(
                height: 130.h,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h, left: 40.w, right: 40.w),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const AddCouponButton(),
            SizedBox(width: 15.w),
            const ConfirmButton(),
          ],
        ),
      ),
    );
  }
}

class MenuList extends GetView<CouponListViewModel> {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedList(
            key: controller.listKey,
            initialItemCount: controller.initCount,
            itemBuilder: (context, index, animation) {
              return index == 0
                  ? SizedBox(height: 50.h)
                  : CardMenu(
                      index: index,
                      animation: animation,
                      menu: controller.getMenu(index));
            },
          ),
        ),
      ],
    );
  }
}

class CardMenu extends StatelessWidget {
  final int index;
  final Animation<double> animation;
  final Menu menu;
  final RxBool isSlide = false.obs;

  CardMenu(
      {Key? key,
      required this.index,
      required this.animation,
      required this.menu})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axis: Axis.vertical,
      sizeFactor: animation,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: ClipRRect(
          child: Slidable(
            actionPane: const SlidableScrollActionPane(),
            showAllActionsThreshold: .5,
            fastThreshold: 5,
            actionExtentRatio: .20,
            controller: SlidableController(
              onSlideIsOpenChanged: (isOpen) {
                if (isOpen != null && !isOpen) isSlide.value = false;
              },
              onSlideAnimationChanged: (animationValue) {
                animationValue?.value == null
                    ? isSlide.value = false
                    : isSlide.value = animationValue?.value != 0;
              },
            ),
            child: MenuCard(
              isSlide: isSlide,
              menuName: menu.menuName,
              quantity: int.parse(menu.freeMenuMaxQty),
            ),
            secondaryActions: [
              DeleteSlider(
                  index: index, menuID: menu.freeMenuId, qrcode: menu.qrcode)
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmButton extends GetView<CouponListViewModel> {
  const ConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 55,
      child: DefaultButton(
        title: "ยืนยันการใช้คูปอง",
        onPressed: controller.onClickConfirmCoupon,
      ),
    );
  }
}

class AddCouponButton extends GetView<CouponListViewModel> {
  const AddCouponButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 45,
      child: DefaultButton(
        title: "เพิ่มคูปอง",
        textColor: AppColor.brightRed,
        overlayColor: Colors.grey.withOpacity(.2),
        backgroundColor: Colors.white,
        prefix: SvgPicture.asset(Assets.tag),
        onPressed: controller.onClickAddCoupon,
      ),
    );
  }
}
