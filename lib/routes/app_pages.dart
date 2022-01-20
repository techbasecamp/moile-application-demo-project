import 'package:demo_project/binding/home_binding.dart';
import 'package:demo_project/view/home/coupon/complete/complete_page.dart';
import 'package:demo_project/view/home/coupon/list/coupon_list_page.dart';
import 'package:demo_project/view/home/coupon/submit/submit_coupon_page.dart';
import 'package:demo_project/view/home/home_page.dart';
import 'package:demo_project/view/login/login_page.dart';
import 'package:demo_project/view/splash/splash_page.dart';
import 'package:demo_project/viewmodels/complete_viewmodel.dart';
import 'package:demo_project/viewmodels/coupon_list_viewmodel.dart';
import 'package:demo_project/viewmodels/login_viewmodel.dart';
import 'package:demo_project/viewmodels/splash_viewmodel.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const splash = '/';

  static const login = '/login';
  static const home = '/home';

  static const submit = '/submit';
  static const list = '/list';
  static const complete = '/complete';

  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashPage(),
      binding: BindingsBuilder(
        () => Get.lazyPut(() => SplashViewModel(Get.find())),
      ),
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      binding: BindingsBuilder(
        () => Get.lazyPut(() => LoginViewModel(Get.find())),
      ),
    ),
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: submit,
          page: () => const SubmitCouponPage(),
        ),
        GetPage(
          name: list,
          page: () => const CouponListPage(),
          binding: BindingsBuilder(
            () => Get.lazyPut(() => CouponListViewModel(Get.find())),
          ),
        ),
        GetPage(
          name: complete,
          page: () => CompletePage(),
          binding: BindingsBuilder(
            () => Get.lazyPut(() => CompleteViewModel(Get.find())),
          ),
        ),
      ],
    ),
  ];
}
