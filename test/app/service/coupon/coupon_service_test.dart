import 'package:demo_project/assets/constants.dart';
import 'package:demo_project/data/local/base_local_storage.dart';
import 'package:demo_project/data/local/local_storage.dart';
import 'package:demo_project/models/coupons/check_coupon_response.dart';
import 'package:demo_project/models/coupons/use_coupon_response.dart';
import 'package:demo_project/repositories/coupon_repository.dart';
import 'package:demo_project/services/coupon_service.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'coupon_service_test.mocks.dart';

@GenerateMocks([CouponRepository, LocalStorage])
void main() {
  const mockToken = "Mock token";

  List<Menu> mockMenus = [
    Menu(
      freeMenuId: '1',
      freeMenuMaxQty: '',
      freeMenuMinQty: '',
      menuName: '',
      qrcode: '12345678',
    ),
    Menu(
      freeMenuId: '1',
      freeMenuMaxQty: '',
      freeMenuMinQty: '',
      menuName: '',
      qrcode: '11111111',
    ),
    Menu(
      freeMenuId: '2',
      freeMenuMaxQty: '',
      freeMenuMinQty: '',
      menuName: '',
      qrcode: '11111111',
    ),
  ];

  BaseLocalStorage storage = MockLocalStorage();
  ICouponRepository couponRepository = MockCouponRepository();
  CouponService couponService = CouponService(couponRepository, storage);

  when(storage.getString(Constant.token)).thenAnswer(
    (_) async => mockToken,
  );

  when(couponRepository.checkCoupon(mockToken, "12345678")).thenAnswer(
    (_) async => CheckCouponResponse(
      memberFirstname: '',
      memberId: 1,
      memberLastname: '',
      menu: [mockMenus[0]],
      messageEn: '',
      messageTh: '',
      promotionId: 1,
      promotionImage: '',
      promotionTitle: '',
      status: '',
      statusDescription: '',
      validCoupon: true,
    ),
  );

  when(couponRepository.checkCoupon(mockToken, "11111111")).thenAnswer(
    (_) async => CheckCouponResponse(
      memberFirstname: '',
      memberId: 1,
      memberLastname: '',
      menu: [mockMenus[1], mockMenus[2]],
      messageEn: '',
      messageTh: '',
      promotionId: 1,
      promotionImage: '',
      promotionTitle: '',
      status: '',
      statusDescription: '',
      validCoupon: true,
    ),
  );

  when(
    couponRepository.useCoupon(
      mockToken,
      ["12345678"],
      [mockMenus[0]],
    ),
  ).thenAnswer(
    (_) async => UseCouponResponse(
      createdTimestamp: DateTime.now(),
      memberFirstname: '',
      memberLastname: '',
      menu: [UsedMenu(menuName: '', quantity: 1)],
      staffScanHistoryId: 1,
    ),
  );

  group('Coupon service', () {
    test("Initial service", () {
      expect(couponService.qrcodes, {});
      expect(couponService.menus, []);
      expect(couponService.useCouponDetail, null);
    });

    test("Add coupon", () async {
      await couponService.addCoupon("12345678");
      expect(couponService.qrcodes, {"12345678": 1});
      expect(couponService.menus.length, 1);
    });

    test("Has QR code", () {
      bool result = couponService.hasQrcode("12345678");
      bool expected = true;
      expect(result, expected);
    });

    test("Hasn't QR code", () {
      bool result = couponService.hasQrcode("87654321");
      bool expected = false;
      expect(result, expected);
    });

    test("Remove Menu", () {
      couponService.removeMenu("12345678", "1");
      expect(couponService.qrcodes, {});
      expect(couponService.menus, []);
    });

    test("Add 2 QR", () async {
      await couponService.addCoupon("12345678");
      await couponService.addCoupon("11111111");
      expect(couponService.qrcodes, {"12345678": 1, "11111111": 2});
      expect(couponService.menus.length, 3);
    });

    test("Clear data", () {
      couponService.clearData();
      expect(couponService.qrcodes, {});
      expect(couponService.menus, []);
    });

    test("Use coupon", () async {
      await couponService.addCoupon("12345678");
      await couponService.useCoupon();
      expect(couponService.useCouponDetail!.menu.length, 1);
    });

    test("Remove some menu", () async {
      couponService.clearData();
      await couponService.addCoupon("12345678");
      await couponService.addCoupon("11111111");
      couponService.removeMenu("11111111", "1");
      expect(couponService.qrcodes, {"11111111": 1, "12345678": 1});
      expect(couponService.menus.length, 2);
    });

    test("Remove some QR", () async {
      couponService.clearData();
      await couponService.addCoupon("12345678");
      await couponService.addCoupon("11111111");
      couponService.removeMenu("12345678", "1");
      expect(couponService.qrcodes, {"11111111": 2});
      expect(couponService.menus.length, 2);
    });
  });
}
