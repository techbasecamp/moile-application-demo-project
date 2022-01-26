import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_project/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponDetail extends StatelessWidget {
  final String date;
  final String time;
  final String customerName;
  final String ref;

  CouponDetail({
    Key? key,
    required this.date,
    required this.time,
    required this.customerName,
    required this.ref,
  }) : super(key: key);

  final TextStyle _titleStyle = TextStyle(
    fontSize: 12.sp,
    color: const Color(0xFF35393E).withOpacity(.8),
  );

  final TextStyle _contentStyle = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF35393E),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AutoSizeText(
                "วันที่",
                style: _titleStyle,
                maxLines: 1,
              ),
              flex: 1,
            ),
            Expanded(
              child: AutoSizeText(
                date,
                style: _contentStyle,
                maxLines: 1,
              ),
              flex: 5,
            ),
            Expanded(
              child: AutoSizeText(
                "เวลา",
                style: _titleStyle,
                maxLines: 1,
              ),
              flex: 2,
            ),
            Expanded(
              child: AutoSizeText(
                time,
                style: _contentStyle,
                maxLines: 1,
              ),
              flex: 2,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AutoSizeText(
                "ลูกค้า",
                style: _titleStyle,
                maxLines: 1,
              ),
              flex: 1,
            ),
            Expanded(
              child: AutoSizeText(
                TextUtil.handleOverflow(customerName, 18),
                style: _contentStyle,
                maxLines: 1,
              ),
              flex: 5,
            ),
            Expanded(
              child: AutoSizeText(
                "เลขอ้างอิง",
                style: _titleStyle,
                maxLines: 1,
              ),
              flex: 2,
            ),
            Expanded(
              child: AutoSizeText(
                ref,
                style: _contentStyle,
                maxLines: 1,
              ),
              flex: 2,
            ),
          ],
        ),
      ],
    );
  }
}
