import 'package:demo_project/models/coupons/use_coupon_response.dart';
import 'package:demo_project/routes/app_pages.dart';
import 'package:demo_project/services/coupon_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CompleteViewModel extends GetxController {
  late final ICouponService _service;

  CompleteViewModel(this._service);

  int get couponNumber => _service.qrcodes.keys.length;
  String get customerName => _service.useCouponDetail!.memberFirstname;
  List<UsedMenu> get orders => _service.useCouponDetail!.menu;

  String get refcode {
    int historyID = _service.useCouponDetail!.staffScanHistoryId;
    String f = '00000';
    return NumberFormat(f).format(historyID);
  }

  String get date {
    DateTime timestamp = _service.useCouponDetail!.createdTimestamp;
    String rawDate = DateFormat.yMd().format(timestamp);
    String month = rawDate.substring(0, 3);
    String day = rawDate.substring(3, 6);
    String year = rawDate.substring(6);
    year = (int.parse(year) + 543).toString().substring(2);
    return day + month + year;
  }

  String get time {
    DateTime timestamp = _service.useCouponDetail!.createdTimestamp;
    String f = 'hh:mm';
    return DateFormat(f).format(timestamp);
  }

  UsedMenu getOrder(int index) {
    return orders[index];
  }

  void onClickComplete() {
    Get.offAllNamed(Routes.home);
  }
}
