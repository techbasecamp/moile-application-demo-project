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

  group("Login Flow Testcase", () {
    testWidgets('Login with correct email,password',
        (WidgetTester tester) async {
      app.main();
      await tester.pump();
      Key username = const Key("username");
      Key password = const Key("password");
      final Finder usernameTextfield = find.byKey(username);
      final Finder passwordTextfield = find.byKey(password);
      final Finder loginButton = find.byKey(
        const Key("login_button"),
      );
      final Finder useCouponMenuButton = find.byKey(const Key("usecoupon"));
      final Finder useCouponTextfield =
          find.byKey(const Key("usecoupon_textfield"));
      final Finder useCouponButton = find.byKey(const Key("usecoupon_button"));

      await pumpUntilFound(tester, usernameTextfield);
      await pumpUntilFound(tester, passwordTextfield);
      await pumpUntilFound(tester, loginButton);
      await tester.enterText(usernameTextfield, "maz@branch2");
      await tester.pumpAndSettle();
      await tester.enterText(passwordTextfield, "123456");
      await tester.pumpAndSettle();
      await tester.tap(loginButton);
      await tester.pump();
      expect(find.text("A Ramen"), findsOneWidget);

      await pumpUntilFound(tester, useCouponMenuButton);
      await tester.tap(useCouponMenuButton);
      await tester.pump();
      await tester.enterText(useCouponTextfield, "123456");
      // await tester.tap(useCouponButton);
    });
  });
}
