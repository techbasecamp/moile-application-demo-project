import 'package:demo_project/components/widgets/branch_title.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test branch title", () {
    testWidgets('Logout Flow', (WidgetTester tester) async {
      await tester.pumpWidget(const BranchTitle(branchName: 'test_name'));
      await tester.pumpAndSettle();
      expect(find.text("test_name"), findsOneWidget);
    });
  });
}
