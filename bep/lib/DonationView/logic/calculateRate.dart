List<double> calculateRate(List<int> values) {
  List<double> result = [];
  int sumValue = values.reduce((value, element) => value + element);

  for (int i = 0; i < values.length; i++) {
    result.add((values[i] / sumValue) * 100);
  }
  return result;
}
