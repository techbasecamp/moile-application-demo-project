import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenWidget extends StatelessWidget {
  final Widget child;
  const ScreenWidget({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => child,
      designSize: const Size(415, 900),
    );
  }
}

class TestableWidget extends StatelessWidget {
  final Widget child;

  const TestableWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        home: Scaffold(
            body: ScreenWidget(
          child: child,
        )),
      ),
    );
  }
}
