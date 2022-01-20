import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurvesCard extends StatelessWidget {
  final Widget child;
  CurvesCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  final BorderRadius _borderRadius = BorderRadius.only(
    topLeft: Radius.circular(70.r),
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: _borderRadius,
        ),
        child: ClipRRect(
          borderRadius: _borderRadius,
          child: child,
        ),
      ),
    );
  }
}
