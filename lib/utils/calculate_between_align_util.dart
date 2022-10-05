class CalculateBetweenAlignUtil {
  static double calculateBetweenAlign(int maxValue, int currentValue) {
    if (currentValue == 1) {
      return 0;
    }

    return (1 / (maxValue - 1)) * (currentValue - 1);
  }
}
