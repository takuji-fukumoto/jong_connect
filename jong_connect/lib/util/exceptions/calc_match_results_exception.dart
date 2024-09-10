class CalcMatchResultsException implements Exception {
  final String message;

  const CalcMatchResultsException(this.message);

  @override
  String toString() => message;
}
