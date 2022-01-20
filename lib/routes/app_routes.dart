part of 'app_pages.dart';

abstract class Routes {
  static const splash = AppPages.splash;

  static const login = AppPages.login;
  static const home = AppPages.home;

  static const submit = AppPages.home + AppPages.submit;
  static const list = AppPages.home + AppPages.list;
  static const complete = AppPages.home + AppPages.complete;
  static const qr = AppPages.home + AppPages.qr;
}
