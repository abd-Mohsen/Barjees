import 'package:collection/collection.dart';

/// represents the state
class Board {
  final List<int> player1;
  final List<int> player2;
  final int depth;
  final Board? parent;

  Board({
    required this.player1,
    required this.player2,
    required this.depth,
    this.parent,
  });

  @override
  String toString() {
    print(player1);
    print(player2);
    return super.toString();
  }

  bool isTerminal() {
    bool oneWon = player1.every((progress) => progress == 83);
    bool twoWon = player2.every((progress) => progress == 83);
    return oneWon || twoWon;
  }

  Board getNextState(int val, int id, bool turn) {
    List<int> copy = turn ? List.from(player1) : List.from(player2);
    copy[id] += val;
    return Board(
      player1: turn ? copy : player1,
      player2: turn ? player2 : copy,
      depth: depth + 1,
      parent: this,
    );
  }

  int evaluate() {
    bool oneWon = player1.every((progress) => progress == 83);
    bool twoWon = player2.every((progress) => progress == 83);

    if (oneWon) return -1000;
    if (twoWon) return 1000;

    int player1Score = 0, player2Score = 0;
    player1Score += player1.sum.abs();
    player2Score += player2.sum.abs();
    // check if you can land on x
    // check if you can eliminate
    // check if you can enter a save zone
    // check if the stone has high progress

    // check if it has less -1 (to insure that he use خال for inserting stones & that you can kick out stones)
    for (int progress in player1) {
      if (progress != -1) player1Score += 40;
    }

    for (int progress in player2) {
      if (progress != -1) player2Score += 40;
    }

    return player2Score - player1Score;
  }
}
