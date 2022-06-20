import 'package:flutter_test/flutter_test.dart';
import 'package:tellstones_recreate/utils/calculate_between_align_util.dart';

void main() {
  test("should return 0 for 1 points with max 3", () {
    //action
    final value = CalculateBetweenAlignUtil.calculateBetweenAlign(3, 1);

    //assert
    expect(value, 0);
  });

  test("should return 0.5 for 2 points with max 3", () {
    //action
    final value = CalculateBetweenAlignUtil.calculateBetweenAlign(3, 2);

    //assert
    expect(value, 0.5);
  });

  test("should return 0.5 for 3 points with max 5", () {
    //action
    final value = CalculateBetweenAlignUtil.calculateBetweenAlign(5, 3);

    //assert
    expect(value, 0.5);
  });

  test("should return 1 for 3 points with max 3", () {
    //action
    final value = CalculateBetweenAlignUtil.calculateBetweenAlign(3, 3);

    //assert
    expect(value, 1);
  });
}
