List<S> expect<T, S>(List<S> values, T Function(S) key) {
  var valuesSet = <T>{};
  List<S> results = [];
  for (var element in values) {
    if (!valuesSet.contains(key(element))) {
      valuesSet.add(key(element));
      results.add(element);
    }
  }
  return results;
}
