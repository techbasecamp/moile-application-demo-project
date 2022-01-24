import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:demo_project/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("Login Flow Testcase", () {
    testWidgets('Login with wrong email,password', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle(const Duration(seconds: 10));
      await tester.pump(const Duration(seconds: 10));
      // Key username = const Key("username");
      // Key password = const Key("password");

      // final Finder usernameTextfield = find.byKey(username);
      // final Finder passwordTextfield = find.byKey(password);
      final Finder loginButton = find.byKey(const Key("login_button"));
      // await tester.enterText(usernameTextfield, "maz@branch2");
      // await tester.enterText(passwordTextfield, "12345678");
      await tester.tap(loginButton);

      await tester.pump(const Duration(seconds: 1));
      await expectLater(find.text("กรุณา"), findsOneWidget);
    });
  });
}
