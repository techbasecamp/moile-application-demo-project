import 'package:demo_project/services/staff_service.dart';
import 'package:demo_project/view/home/home_page.dart';
import 'package:demo_project/viewmodels/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mockito/annotations.dart';
import '../testable_screenutil.dart';
import 'appbar_widget_test.mocks.dart';

@GenerateMocks([StaffService])
void main() {
  var staffService = MockStaffService();
  setUpAll(() {
    final HomeViewModel homeViewModel = Get.put(HomeViewModel(staffService));
  });
  group("Test AppBar", () {
    testWidgets('Init Appbar', (WidgetTester tester) async {
      await tester.pumpAndSettle();
      await tester.pumpWidget(const TestWidget(child: CustomAppbar()));
      await tester.pump();
      final Finder logout = find.byTooltip("Logout");
      expect(logout, findsOneWidget);
    });
  });
}
