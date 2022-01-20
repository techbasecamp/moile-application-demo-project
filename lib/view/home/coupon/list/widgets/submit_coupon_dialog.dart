import 'package:demo_project/view/home/coupon/submit/widgets/submit_coupon_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitCouponDialog extends StatelessWidget {
  const SubmitCouponDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: SizedBox(
        height: 750.h,
        child: SummitCouponForm(errorColor: Colors.white, isDialog: true),
      ),
    );
  }
}
