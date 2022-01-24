class FormatNumberTestCase {
  late String testName;
  late int testNumber;
  late int? testLimit;
  late String expectedResult;

  FormatNumberTestCase({
    required this.testName,
    required this.testNumber,
    required this.testLimit,
    required this.expectedResult,
  });
}

List<FormatNumberTestCase> formatNumberTestcases = [
  FormatNumberTestCase(
    testName: 'Test unit digit with out limit',
    testNumber: 5,
    testLimit: null,
    expectedResult: '5',
  ),
  FormatNumberTestCase(
    testName: 'Test unit digit negetive value with out limit',
    testNumber: -5,
    testLimit: null,
    expectedResult: '-5',
  ),
  FormatNumberTestCase(
    testName: 'Test 4 digit with out limit',
    testNumber: 5000,
    testLimit: null,
    expectedResult: '5,000',
  ),
  FormatNumberTestCase(
    testName: 'Test 4 digit negative value with out limit',
    testNumber: -5000,
    testLimit: null,
    expectedResult: '-5,000',
  ),
  FormatNumberTestCase(
    testName: 'Test 4 digit negative value over limit',
    testNumber: 5000,
    testLimit: 999,
    expectedResult: '999+',
  ),
  FormatNumberTestCase(
    testName: 'Test 4 digit negative value not over limit',
    testNumber: 5000,
    testLimit: 10000,
    expectedResult: '5,000',
  ),
  FormatNumberTestCase(
    testName: 'Test over limit 4 digit limit',
    testNumber: 50000,
    testLimit: 9999,
    expectedResult: '9,999+',
  ),
  FormatNumberTestCase(
    testName: 'Test negative value over limit',
    testNumber: -50000,
    testLimit: -100000,
    expectedResult: '-100,000+',
  ),
];
