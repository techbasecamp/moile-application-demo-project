part of 'app_pages.dart';

abstract class Routes {
  static const splash = '/';

  static const login = '/login';
  static const home = '/home';

  static const coupon = '/coupon';
  static const submit = '/submit';
  static const list = '/list';
  static const complete = '/complete';
  static const qr = '/qr';
}

abstract class Paths {
  static const coupon = Routes.home + Routes.coupon;
  static const submit = Routes.home + Routes.coupon + Routes.submit;
  static const list = Routes.home + Routes.coupon + Routes.list;
  static const complete = Routes.home + Routes.coupon + Routes.complete;
  static const qr = Routes.home + Routes.coupon + Routes.qr;
}
