List<List<String>> getPermutations(List<String> list) {
  List<List<String>> permutations = [];
  _generatePermutations(list, 0, permutations);
  return permutations;
}

void _generatePermutations(List<String> list, int start, List<List<String>> permutations) {
  if (start == list.length - 1) {
    permutations.add(List.from(list));
    return;
  }

  for (int i = start; i < list.length; i++) {
    if (_shouldSwap(list, start, i)) {
      _swap(list, start, i);
      _generatePermutations(list, start + 1, permutations);
      _swap(list, start, i);
    }
  }
}

bool _shouldSwap(List<String> list, int start, int current) {
  for (int i = start; i < current; i++) {
    if (list[i] == list[current]) {
      return false;
    }
  }
  return true;
}

void _swap(List<String> list, int i, int j) {
  String temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}
