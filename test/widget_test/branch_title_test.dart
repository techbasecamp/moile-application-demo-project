import 'package:demo_project/components/widgets/branch_title.dart';
import 'package:flutter_test/flutter_test.dart';

import 'testable_screenutil.dart';

void main() {
  group("Test branch title", () {
    testWidgets('Init Branch Title', (WidgetTester tester) async {
      await tester.pumpAndSettle();
      await tester.pumpWidget(
          const TestWidget(child: BranchTitle(branchName: 'test_name')));
      await tester.pump();
      expect(find.text("test_name"), findsOneWidget);
    });
  });
}
