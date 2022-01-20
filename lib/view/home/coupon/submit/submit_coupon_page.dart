import 'package:demo_project/assets/app_colors.dart';
import 'package:demo_project/components/widgets/default_appbar.dart';
import 'package:demo_project/viewmodels/submit_coupon_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/submit_coupon_form.dart';

class SubmitCouponPage extends GetView<SubmitCouponViewModel> {
  const SubmitCouponPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.clearCouponData();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const DefaultAppbar(),
      backgroundColor: AppColor.greyBackground,
      body: SummitCouponForm(isDialog: false),
    );
  }
}
