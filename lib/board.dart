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
}
