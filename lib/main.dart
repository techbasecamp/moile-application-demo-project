import 'package:demo_project/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'binding/app_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(415, 900),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'A Ramen Staff',
        theme: ThemeData(),
        getPages: AppPages.routes,
        initialBinding: AppBinding(),
      ),
    );
  }
}
