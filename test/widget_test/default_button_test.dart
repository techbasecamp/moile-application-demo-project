import 'package:demo_project/components/widgets/default_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'testable_screenutil.dart';

void main() {
  group("Test Default Button", () {
    testWidgets('Init Button', (WidgetTester tester) async {
      String result = "";
      await tester.pumpAndSettle();
      await tester.pumpWidget(TestWidget(
          child: DefaultButton(
        key: const Key("button"),
        title: "TEST",
        onPressed: () {
          if (kDebugMode) {
            result = "tapped";
          }
        },
      )));
      await tester.pump();
      final Finder button = find.byKey(const Key("button"));
      expect(button, findsOneWidget);

      await tester.tap(button);
      expect(result, "tapped");
    });
  });
}
