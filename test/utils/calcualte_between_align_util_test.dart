import 'package:flutter_test/flutter_test.dart';
import 'package:tellstones_recreate/utils/calculate_between_align_util.dart';

void main() {
  test("should return 0 for 1 points with max 3", () {
    // Action.
    final value = CalculateBetweenAlignUtil.calculateBetweenAlign(3, 1);

    // Assert.
    expect(value, 0);
  });

  test("should return 0.5 for 2 points with max 3", () {
    // Action.
    final value = CalculateBetweenAlignUtil.calculateBetweenAlign(3, 2);

    // Assert.
    const expectedValue = 0.5;
    expect(value, expectedValue);
  });

  test("should return 0.5 for 3 points with max 5", () {
    // Action.
    final value = CalculateBetweenAlignUtil.calculateBetweenAlign(5, 3);

    // Assert.
    const expectedValue = 0.5;
    expect(value, expectedValue);
  });

  test("should return 1 for 3 points with max 3", () {
    // Action.
    final value = CalculateBetweenAlignUtil.calculateBetweenAlign(3, 3);

    // Assert.
    expect(value, 1);
  });
}
