import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:demo_project/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {});
  tearDownAll(() {});
  Future<void> pumpUntilFound(
    WidgetTester tester,
    Finder finder, {
    Duration timeout = const Duration(seconds: 30),
  }) async {
    bool timerDone = false;
    final timer = Timer(
        timeout, () => throw TimeoutException("Pump until has timed out"));
    while (timerDone != true) {
      await tester.pump();
      final found = tester.any(finder);
      if (found) {
        timerDone = true;
      }
    }
    timer.cancel();
  }

  group("Logout Flow Testcase", () {
    testWidgets('Logout Flow', (WidgetTester tester) async {
      app.main();
      await tester.pump(const Duration(seconds: 3));
      Key username = const Key("username");
      Key password = const Key("password");
      final Finder usernameTextfield = find.byKey(username);
      final Finder passwordTextfield = find.byKey(password);
      final Finder loginButton = find.byKey(
        const Key("login_button"),
      );
      await pumpUntilFound(tester, usernameTextfield);
      await pumpUntilFound(tester, passwordTextfield);
      await pumpUntilFound(tester, loginButton);
      await tester.enterText(usernameTextfield, "maz@branch2");
      await tester.pumpAndSettle();
      await tester.enterText(passwordTextfield, "123456");
      await tester.pumpAndSettle();
      await tester.tap(loginButton);
      await tester.pumpAndSettle();
      await pumpUntilFound(tester, find.text("A Ramen"));
      final logoutButton = find.byIcon(Icons.logout_outlined);
      await pumpUntilFound(tester, logoutButton);
      await tester.tap(logoutButton);
      await tester.pump(const Duration(seconds: 2));
      
      expect(find.text("Login"), findsOneWidget);
    });
  });
}
