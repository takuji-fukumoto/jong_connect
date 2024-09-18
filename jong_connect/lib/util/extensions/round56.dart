extension DoubleExtension on double {
  /// 5捨6入
  int round56() {
    const roundingPoint = 0.4; // 5捨6入の基準点
    if (this == 0) {
      return 0;
    }

    return (isNegative ? this - roundingPoint : this + roundingPoint).toInt();
  }
}
