class OverflowTestCase {
  late String testName;
  late String testText;
  late int testLimit;
  late String expectedResult;

  OverflowTestCase({
    required this.testName,
    required this.testText,
    required this.testLimit,
    required this.expectedResult,
  });
}

List<OverflowTestCase> textOverflowTestcases = [
  OverflowTestCase(
    testName: 'Text Not Overflow',
    testText: 'abcd',
    testLimit: 10,
    expectedResult: 'abcd',
  ),
  OverflowTestCase(
    testName: 'Text Overflow',
    testText: 'abcdef',
    testLimit: 5,
    expectedResult: 'abcde...',
  ),
  OverflowTestCase(
    testName: 'Negative limit value',
    testText: 'abcdef',
    testLimit: -1,
    expectedResult: 'abcdef',
  ),
  OverflowTestCase(
    testName: 'Zero limit value',
    testText: 'abcdef',
    testLimit: 0,
    expectedResult: 'abcdef',
  ),
  OverflowTestCase(
    testName: 'Length text equal limit',
    testText: 'abcdef',
    testLimit: 6,
    expectedResult: 'abcdef',
  ),
];
