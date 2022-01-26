import 'package:demo_project/services/staff_service.dart';
import 'package:demo_project/view/home/home_page.dart';
import 'package:demo_project/viewmodels/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../appbar/appbar_widget_test.mocks.dart';
import '../testable_screenutil.dart';

@GenerateMocks([StaffService])
void main() {
  var staffService = MockStaffService();
  setUpAll(() {
    Get.put(HomeViewModel(staffService));
  });

  when(staffService.branchName).thenReturn("");
  group("Test HomePage", () {
    testWidgets('Init HomePage', (WidgetTester tester) async {
      await tester.pumpAndSettle();
      await tester.pumpWidget(const TestWidget(child: HomePage()));
      await tester.pump();
      expect(find.text(""), findsOneWidget);
    });
  });
}
