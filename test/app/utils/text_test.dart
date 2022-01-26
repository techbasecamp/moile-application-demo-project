import 'package:flutter_test/flutter_test.dart';

import 'package:demo_project/utils/text.dart';

import 'testcases/format_number_testcases.dart';
import 'testcases/text_overflow_testcases.dart';

void main() {
  group('Handle Overflow', () {
    for (var testcase in textOverflowTestcases) {
      test(testcase.testName, () {
        String result = TextUtil.handleOverflow(
          testcase.testText,
          testcase.testLimit,
        );

        expect(result, testcase.expectedResult);
      });
    }
  });

  group('Format Number', () {
    for (var testcase in formatNumberTestcases) {
      test(testcase.testName, () {
        String result = TextUtil.formatNumber(
          testcase.testNumber,
          limit: testcase.testLimit,
        );

        expect(result, testcase.expectedResult);
      });
    }
  });
}
