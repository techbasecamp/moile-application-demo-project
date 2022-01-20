abstract class ApiEndPoints {
  static const String _staffGroup = "staff/";
  static const String _couponGroup = "coupon/";

  static const String login = _staffGroup + "login";
  static const String info = _staffGroup + "info";

  static const String checkQRCode = _couponGroup + "check-qrcode";
  static const String userCoupon = _couponGroup + "use";
}
