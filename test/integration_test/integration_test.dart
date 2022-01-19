import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:demo_project/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
      await tester.pump(const Duration(seconds: 3));
      final Finder fab = find.byTooltip('Increment');
      await tester.tap(fab);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 3));
      expect(find.text('1'), findsOneWidget);
      await tester.pump(const Duration(seconds: 3));
    });
  });
}
