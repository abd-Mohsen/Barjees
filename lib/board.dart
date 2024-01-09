/// represents the state
class Board {
  final List<int> player1;
  final List<int> player2;
  final int cost;
  final int heuristic;
  final int depth;
  final Board? parent;

  Board({
    required this.player1,
    required this.player2,
    required this.cost,
    required this.heuristic,
    required this.depth,
    this.parent,
  });

  int get playerOneScore => player1.where((element) => element == 83).length;
  int get playerTwoScore => player2.where((element) => element == 83).length;
}
