import 'package:demo_project/view/home/home_page.dart';
import 'package:demo_project/view/login/login_page.dart';
import 'package:demo_project/view/splash/splash_page.dart';
import 'package:demo_project/viewmodels/auth_viewmodel.dart';
import 'package:demo_project/viewmodels/splash_viewmodel.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.splash;

  static final routes = [
    GetPage(
      name: "/",
      page: () => const SplashPage(),
      binding: BindingsBuilder(
        () => Get.lazyPut(() => SplashViewModel(Get.find())),
      ),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: BindingsBuilder(
        () => Get.lazyPut(() => AuthViewModel(Get.find())),
      ),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: BindingsBuilder(
        () => Get.lazyPut(() => AuthViewModel(Get.find())),
      ),
    ),
  ];
}
