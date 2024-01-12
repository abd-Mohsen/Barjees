import 'package:collection/collection.dart';

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

  bool isTerminal() {
    bool oneWon = player1.every((progress) => progress == 83);
    bool twoWon = player2.every((progress) => progress == 83);
    return oneWon || twoWon;
  }

  List<Board> generateChildren() {
    List<Board> children = [];
    //
    return children;
  }

  int evaluate() {
    bool oneWon = player1.every((progress) => progress == 83);
    bool twoWon = player2.every((progress) => progress == 83);

    if (oneWon) return 1000;
    if (twoWon) return -1000;

    int player1Score = 0, player2Score = 0;
    player1Score += player1.sum.abs();
    player2Score += player2.sum.abs();
    // check if you can land on x
    // check if you can eliminate
    // check if you can enter a save zone
    // check if the stone has high progress

    return player1Score - player2Score;
  }
}
