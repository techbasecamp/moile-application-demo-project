import 'package:demo_project/data/network/network_api_service.dart';
import 'package:demo_project/repositories/staff_repository.dart';
import 'package:demo_project/services/coupon_service.dart';
import 'package:demo_project/services/staff_service.dart';
import 'package:demo_project/view/home/home_page.dart';
import 'package:demo_project/viewmodels/home_viewmodel.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../testable_screenutil.dart';

@GenerateMocks([StaffService])
void main() {
  setUpAll(() {});
  group("Test AppBar", () {
    // testWidgets('Init Appbar', (WidgetTester tester) async {
    //   await tester.pumpAndSettle();
    //   await tester.pumpWidget(const TestableWidget(
    //       child: GetX(
    //           init: HomeViewModel(),
    //           builder: (controller) => HomePageAppbar())));
    //   await tester.pump();
    //   final Finder logout = find.byTooltip("Logout");
    //   expect(logout, findsOneWidget);
    // });
  });
}
