class CalculateBetweenAlignUtil {
  static double calculateBetweenAlign(int maxValue, int currentValue) {
    if (currentValue == 1) {
      return 0;
    }
    final percent = (1 / (maxValue - 1)) * (currentValue - 1);
    return percent;
  }
}
