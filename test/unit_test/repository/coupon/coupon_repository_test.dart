import 'package:demo_project/data/exception.dart';
import 'package:demo_project/data/network/api_end_points.dart';
import 'package:demo_project/data/network/base_api_service.dart';
import 'package:demo_project/data/network/network_api_service.dart';
import 'package:demo_project/models/coupons/check_coupon_response.dart';
import 'package:demo_project/repositories/coupon_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../staff/staff_repository_test.mocks.dart';

@GenerateMocks([NetworkApiService])
void main() {
  const mockToken = "Mock token";

  BaseApiService apiService = MockNetworkApiService();
  CouponRepository couponRepository = CouponRepository(apiService);

  when(
    apiService.postResponse(
      ApiEndPoints.checkQRCode,
      {
        "qrcode": "12345678",
        "coupon_type": "แถมฟรี",
        "order_channel": "E",
      },
      token: mockToken,
    ),
  ).thenAnswer(
    (_) async => {
      "valid_coupon": true,
      "created_timestamp": "19700101",
      "member_firstname": '',
      "member_lastname": '',
      "menu": [
        {
          "free_menu_id": '1',
          "free_menu_max_qty": '',
          "free_menu_min_qty": '',
          "menu_name": '',
          "qrcode": '12345678',
        }
      ],
      "staff_scan_history_id": 1,
    },
  );

  when(
    apiService.postResponse(
      ApiEndPoints.checkQRCode,
      {
        "qrcode": "11111111",
        "coupon_type": "แถมฟรี",
        "order_channel": "E",
      },
      token: mockToken,
    ),
  ).thenAnswer(
    (_) async => {
      "valid_coupon": false,
      "message_th": "รหัสคูปองไม่ถูกต้อง",
      "message_en": "Invalid coupon code",
    },
  );

  when(
    apiService.postResponse(
      ApiEndPoints.checkQRCode,
      {
        "qrcode": "12345678",
        "coupon_type": "แถมฟรี",
        "order_channel": "E",
      },
      token: '',
    ),
  ).thenAnswer(
    (_) async => throw UnauthorisedException,
  );

  List<String> mockQrcodes = ["12345678"];
  List<Menu> mockMenus = [
    Menu(
      freeMenuId: '1',
      freeMenuMaxQty: '',
      freeMenuMinQty: '',
      menuName: '',
      qrcode: '12345678',
    )
  ];

  when(
    apiService.postResponse(
      ApiEndPoints.useCoupon,
      {
        "qrcode": mockQrcodes,
        "menu": mockMenus.map((i) => i.toJson()).toList(),
      },
      token: '',
    ),
  ).thenAnswer(
    (_) async => throw UnauthorisedException,
  );

  when(
    apiService.postResponse(
      ApiEndPoints.useCoupon,
      {
        "qrcode": mockQrcodes,
        "menu": mockMenus.map((i) => i.toJson()).toList(),
      },
      token: mockToken,
    ),
  ).thenAnswer(
    (_) async => {
      "staff_scan_history_id": 1,
      "member_firstname": "",
      "member_lastname": "",
      "created_timestamp": "19700101",
      "menu": [
        {
          "menu_name": '',
          "quantity": 1,
        }
      ],
    },
  );

  group('Coupon repository', () {
    test('Check coupon with valid qrcode', () async {
      var response = await couponRepository.checkCoupon(mockToken, "12345678");
      expect(response.validCoupon, true);
      expect(response.menu.length, 1);
      expect(response.menu[0].freeMenuId, "1");
    });

    test('Check coupon with invalid qrcode', () async {
      var response = await couponRepository.checkCoupon(mockToken, "11111111");
      expect(response.validCoupon, false);
      expect(response.messageTh, "รหัสคูปองไม่ถูกต้อง");
      expect(response.messageEn, "Invalid coupon code");
    });

    test('Check coupon with invalid token', () async {
      try {
        await couponRepository.checkCoupon('', "12345678");
      } catch (e) {
        expect(e, UnauthorisedException);
      }
    });

    test('Use coupon', () async {
      var response =
          await couponRepository.useCoupon(mockToken, mockQrcodes, mockMenus);
      expect(response.menu.length, 1);
      expect(response.menu[0].menuName, "");
      expect(response.menu[0].quantity, 1);
    });

    test('Use coupon with invalid token', () async {
      try {
        await couponRepository.useCoupon('', mockQrcodes, mockMenus);
      } catch (e) {
        expect(e, UnauthorisedException);
      }
    });
  });
}
