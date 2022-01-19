import 'package:demo_project/view/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Project',
      theme: ThemeData(),
      home: ScreenUtilInit(
          designSize: const Size(415, 900), builder: () => const SplashPage()),
    );
  }
}
