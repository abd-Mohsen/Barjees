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

  // print current state
  // void printBoard() {
  //   for (List<String> row in cells) {
  //     String s = "";
  //     for (String cell in row) {
  //       s = '$s $cell ';
  //     }
  //     print(s);
  //   }
  //   print("");
  // }
}
