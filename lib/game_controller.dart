import 'dart:math';

import 'package:algo_project/position.dart';
import 'package:algo_project/stone_model.dart';
import 'package:algo_project/ui/shell.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'board.dart';
import 'constants.dart';

class GameController extends GetxController {
  // 19 * 19 grid
  // a for regular cell
  // x for X cell
  // k for kitchen cells

  List<List<String>> cells = [
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'x', 'a', 'x', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ['a', 'a', 'x', 'a', 'a', 'a', 'a', 'a', 'k', 'k', 'k', 'a', 'a', 'a', 'a', 'a', 'x', 'a', 'a'],
    ['a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'k', 'k', 'k', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a'],
    ['a', 'a', 'x', 'a', 'a', 'a', 'a', 'a', 'k', 'k', 'k', 'a', 'a', 'a', 'a', 'a', 'x', 'a', 'a'],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'x', 'a', 'x', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  ];

  late Board currentBoard;
  @override
  void onInit() {
    currentBoard = Board(
      player1: List.from(p1),
      player2: List.from(p2),
      depth: 0,
    );
    List<StoneModel> stones1 = List.generate(4, (i) => StoneModel(id: i, player: true));
    List<StoneModel> stones2 = List.generate(4, (i) => StoneModel(id: i, player: false));
    stones = [...stones1, ...stones2];
    super.onInit();
  }

  late List<StoneModel> stones;

  // is player1 turn
  bool turn = true;
  bool computer = true;

  // actions generated from throwing in the current turn
  List<String> actions = [];

  // path that player1 stones take to reach kitchen
  final List<Position> path1 = [
    Position(9, 7),
    Position(9, 6),
    Position(9, 5),
    Position(9, 4),
    Position(9, 3),
    Position(9, 2),
    Position(9, 1),
    Position(9, 0),
    Position(8, 0),
    Position(8, 1),
    Position(8, 2),
    Position(8, 3),
    Position(8, 4),
    Position(8, 5),
    Position(8, 6),
    Position(8, 7),
    Position(7, 8),
    Position(6, 8),
    Position(5, 8),
    Position(4, 8),
    Position(3, 8),
    Position(2, 8),
    Position(1, 8),
    Position(0, 8),
    Position(0, 9),
    Position(0, 10),
    Position(1, 10),
    Position(2, 10),
    Position(3, 10),
    Position(4, 10),
    Position(5, 10),
    Position(6, 10),
    Position(7, 10),
    Position(8, 11),
    Position(8, 12),
    Position(8, 13),
    Position(8, 14),
    Position(8, 15),
    Position(8, 16),
    Position(8, 17),
    Position(8, 18),
    Position(9, 18),
    Position(10, 18),
    Position(10, 17),
    Position(10, 16),
    Position(10, 15),
    Position(10, 14),
    Position(10, 13),
    Position(10, 12),
    Position(10, 11),
    Position(11, 10),
    Position(12, 10),
    Position(13, 10),
    Position(14, 10),
    Position(15, 10),
    Position(16, 10),
    Position(17, 10),
    Position(18, 10),
    Position(18, 9),
    Position(18, 8),
    Position(17, 8),
    Position(16, 8),
    Position(15, 8),
    Position(14, 8),
    Position(13, 8),
    Position(12, 8),
    Position(11, 8),
    Position(10, 7),
    Position(10, 6),
    Position(10, 5),
    Position(10, 4),
    Position(10, 3),
    Position(10, 2),
    Position(10, 1),
    Position(10, 0),
    Position(9, 0),
    Position(9, 1),
    Position(9, 2),
    Position(9, 3),
    Position(9, 4),
    Position(9, 5),
    Position(9, 6),
    Position(9, 7),
    Position(9, 8),
  ];

  // path that player2 stones take to reach kitchen
  final List<Position> path2 = [
    Position(9, 11),
    Position(9, 12),
    Position(9, 13),
    Position(9, 14),
    Position(9, 15),
    Position(9, 16),
    Position(9, 17),
    Position(9, 18),
    Position(10, 18),
    Position(10, 17),
    Position(10, 16),
    Position(10, 15),
    Position(10, 14),
    Position(10, 13),
    Position(10, 12),
    Position(10, 11),
    Position(11, 10),
    Position(12, 10),
    Position(13, 10),
    Position(14, 10),
    Position(15, 10),
    Position(16, 10),
    Position(17, 10),
    Position(18, 10),
    Position(18, 9),
    Position(18, 8),
    Position(17, 8),
    Position(16, 8),
    Position(15, 8),
    Position(14, 8),
    Position(13, 8),
    Position(12, 8),
    Position(11, 8),
    Position(10, 7),
    Position(10, 6),
    Position(10, 5),
    Position(10, 4),
    Position(10, 3),
    Position(10, 2),
    Position(10, 1),
    Position(10, 0),
    Position(9, 0),
    Position(8, 0),
    Position(8, 1),
    Position(8, 2),
    Position(8, 3),
    Position(8, 4),
    Position(8, 5),
    Position(8, 6),
    Position(8, 7),
    Position(7, 8),
    Position(6, 8),
    Position(5, 8),
    Position(4, 8),
    Position(3, 8),
    Position(2, 8),
    Position(1, 8),
    Position(0, 8),
    Position(0, 9),
    Position(0, 10),
    Position(1, 10),
    Position(2, 10),
    Position(3, 10),
    Position(4, 10),
    Position(5, 10),
    Position(6, 10),
    Position(7, 10),
    Position(8, 11),
    Position(8, 12),
    Position(8, 13),
    Position(8, 14),
    Position(8, 15),
    Position(8, 16),
    Position(8, 17),
    Position(8, 18),
    Position(9, 18),
    Position(9, 17),
    Position(9, 16),
    Position(9, 15),
    Position(9, 14),
    Position(9, 13),
    Position(9, 12),
    Position(9, 11),
    Position(9, 10),
  ];

  // initial location of every player1 piece on path1
  List<int> p1 = [-1, -1, -1, -1];

  // initial location of every player2 piece on path2
  List<int> p2 = [-1, -1, -1, -1];

  // throw name, depending on the num of closed shells
  final Map<int, String> throwName = {
    0: "شكة",
    1: "دست",
    2: "دواق",
    3: "تلاتة",
    4: "أربعة",
    5: "بنج",
    6: "بارا",
  };

  final Map<String, int> actionValue = {
    "خال": 1,
    "شكة": 6,
    "دست": 10,
    "دواق": 2,
    "تلاتة": 3,
    "أربعة": 4,
    "بنج": 25,
    "بارا": 12,
  };

  // X cells
  Set<Position> castle = {
    Position(2, 10),
    Position(2, 8),
    Position(8, 16),
    Position(10, 16),
    Position(8, 2),
    Position(10, 2),
    Position(16, 10),
    Position(16, 8),
  };

  // cells in the middle
  Set<Position> kitchen = {
    Position(8, 10),
    Position(8, 9),
    Position(8, 8),
    Position(9, 10),
    Position(9, 9),
    Position(9, 8),
    Position(10, 10),
    Position(10, 9),
    Position(10, 8),
  };

  int remainingThrows = 1;

  //just a test, don't mind it
  void drawPath() async {
    for (Position pos in kitchen) {
      cells[pos.r][pos.c] == ' ' || cells[pos.r][pos.c] == 'k' ? cells[pos.r][pos.c] = 'a' : cells[pos.r][pos.c] = ' ';
      print("${pos.r},${pos.c}");
      await Future.delayed(const Duration(milliseconds: 200));
      update();
    }
  }

  void restartGame() {
    currentBoard = Board(
      player1: List.from(p1),
      player2: List.from(p2),
      depth: 0,
    );
    update();
  }

  Future<void> throwShells() async {
    if (remainingThrows == 0) return;
    int res = randomWithProbability();
    List<Widget> shells = [];
    for (int i = 0; i < 6; i++) {
      shells.add(Shell(closed: i < res));
    }

    switch (res) {
      case 0:
        {
          if (remainingThrows < 4) remainingThrows++;
          actions.add("شكة"); // move 6
        }
      case 1:
        {
          if (remainingThrows < 4) remainingThrows++;
          actions.add("خال");
          actions.add("دست"); // move 10
        }
      case 2:
        {
          actions.add("دواق"); // move 2
        }
      case 3:
        {
          actions.add("تلاتة"); // move 3
        }
      case 4:
        {
          actions.add("أربعة"); // move 4
        }
      case 5:
        {
          if (remainingThrows < 4) remainingThrows++;
          actions.add("خال");
          actions.add("بنج"); // move 24
        }
      case 6:
        {
          if (remainingThrows < 6) remainingThrows++;
          actions.add("بارا"); // move 12
        }

      default:
        actions.add("wtf");
    }
    remainingThrows--;
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(milliseconds: 800),
        titleText: Text(
          throwName[res]!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: kNormalColor,
          ),
        ),
        messageText: Row(
          children: shells,
        ),
      ),
    );
    if (turn || (!turn && !computer)) await switchTurn();
    update();
  }

  int randomWithProbability() {
    Random random = Random();
    double randomNumber = random.nextDouble();

    if (randomNumber < 0.015625) {
      return 0;
    } else if (randomNumber < 0.109375) {
      return 1;
    } else if (randomNumber < 0.34375) {
      return 2;
    } else if (randomNumber < 0.65625) {
      return 3;
    } else if (randomNumber < 0.890625) {
      return 4;
    } else if (randomNumber < 0.984375) {
      return 5;
    } else {
      return 6;
    }
  }

  Future<Board?> doAction(int id, String action) async {
    if (remainingThrows > 0 || !validateAction(id, action, currentBoard)) return null;

    //turn ? currentBoard.player1[id] += actionValue[action]! : currentBoard.player2[id] += actionValue[action]!;
    currentBoard = currentBoard.getNextState(actionValue[action]!, id, turn);
    actions.remove(action);
    eliminate(id, currentBoard); // pass the id of the eliminator

    if (turn || (!turn && !computer)) await switchTurn();
    update();
    return currentBoard;
  }

  List<String> showActions(int id) {
    List<String> res = [];
    for (String action in actions.toSet()) {
      if (validateAction(id, action, currentBoard)) res.add(action);
    }
    //print(res);
    return res;
  }

  bool validateAction(int id, String action, Board state) {
    if (!actionValue.containsKey(action)) return false;
    int val = actionValue[action]!;
    int pos1 = state.player1[id];
    int pos2 = state.player2[id];
    bool outOfBounds = turn ? pos1 + val > 83 : pos2 + val > 83;
    if (outOfBounds) return false; // try this
    bool blocked = opponentInCastle(turn ? path1[pos1 + val] : path2[pos2 + val]);
    bool outside = action != "خال" && (turn ? pos1 == -1 : pos2 == -1);
    //print("$action: $blocked, $outOfBounds, $outside");
    return !blocked && !outOfBounds && !outside;
  }

  bool opponentInCastle(Position pos) {
    if (turn) {
      for (int stone in currentBoard.player2) {
        if (stone == -1) continue;
        if (path2[stone] == pos && castle.contains(pos)) return true;
      }
      return false;
    }

    for (int stone in currentBoard.player1) {
      if (stone == -1) continue;
      if (path1[stone] == pos && castle.contains(pos)) return true;
    }
    return false;
  }

  void eliminate(int id, Board state) {
    List<int> pos1 = state.player1;
    List<int> pos2 = state.player2;
    // check if those two lists are passed by val or ref
    Position pos = turn ? path1[pos1[id]] : path2[pos2[id]];
    if (opponentInCastle(pos)) return;
    if (turn) {
      for (int i = 0; i < 4; i++) {
        if (pos2[i] != -1 && path2[pos2[i]] == pos) {
          pos2[i] = -1;
        }
      }
      return;
    }

    for (int i = 0; i < 4; i++) {
      if (pos1[i] != -1 && path1[pos1[i]] == pos) {
        pos1[i] = -1;
      }
    }
  }

  Future<void> switchTurn() async {
    update();
    if (remainingThrows == 0 && (actions.isEmpty || noActionAvailable(currentBoard))) {
      actions.clear();
      turn ? turn = false : turn = true;
      remainingThrows++;
      await Future.delayed(const Duration(milliseconds: 800));
      if (!turn) await pc();
    }
  }

  bool noActionAvailable(Board state) {
    for (String action in actions) {
      for (int i = 0; i < 4; i++) {
        if (validateAction(i, action, state)) return false;
      }
    }
    return true;
  }

  // print current state
  void printBoard() {
    for (List<String> row in cells) {
      String s = "";
      for (String cell in row) {
        // print stone instead if exists in current position
        s = '$s $cell ';
      }
      print(s);
    }
    print("");
  }

  List<int> getPositions() {
    return turn ? currentBoard.player1 : currentBoard.player2;
  }

  List<StoneModel> getStones1(int r, int c) {
    List<StoneModel> res = [];
    for (StoneModel stone in stones.where((element) => element.player)) {
      List<int> pos1 = currentBoard.player1;
      if (pos1[stone.id] == 84) continue;
      bool sameRow = pos1[stone.id] == -1 ? r == 2 + stone.id : r == path1[pos1[stone.id]].r;

      bool sameColumn = pos1[stone.id] == -1 ? c == 2 : c == path1[pos1[stone.id]].c;

      if (sameRow && sameColumn) res.add(stone);
    }
    return res;
  }

  List<StoneModel> getStones2(int r, int c) {
    //currentBoard.player1[i] == -1 ? Position(2 + i, 2) : path1[currentBoard.player1[i]],
    //currentBoard.player2[i] == -1 ? Position(13 + i, 17) : path2[currentBoard.player2[i]],
    List<StoneModel> res = [];
    for (StoneModel stone in stones.where((element) => !element.player)) {
      List<int> pos2 = currentBoard.player2;
      if (pos2[stone.id] == 84) continue;
      bool sameRow = (pos2[stone.id] == -1 ? r == 13 + stone.id : r == path2[pos2[stone.id]].r);

      bool sameColumn = (pos2[stone.id] == -1 ? c == 16 : c == path2[pos2[stone.id]].c);

      if (sameRow && sameColumn) res.add(stone);
    }
    return res;
  }

  Future<void> pc() async {
    await Future.delayed(const Duration(milliseconds: 400));
    if (!computer) return;
    //if (turn) return;
    while (remainingThrows > 0) {
      await throwShells();
      await Future.delayed(const Duration(milliseconds: 1200));
    }
    await Future.delayed(const Duration(milliseconds: 800));
    Board? newState = await findBestState(currentBoard, 2);
    actions.clear();
    if (newState != null) currentBoard = newState;
    await switchTurn();
    print("pc played");
    update();
  }

  Future<int> minimax(Board board, int depth, bool isMax) async {
    if (depth == 0 || board.isTerminal()) {
      return evaluate(board);
    }
    var nextStates = await getNextStates();
    if (isMax) {
      int maxEval = -9999;
      for (Board child in nextStates) {
        int eval = await minimax(child, depth - 1, false);
        maxEval = max(maxEval, eval);
      }
      return maxEval;
    } else {
      int minEval = 9999;
      for (Board child in nextStates) {
        int eval = await minimax(child, depth - 1, true);
        minEval = min(minEval, eval);
      }
      return minEval;
    }
  }

  Future<Board?> findBestState(Board board, int depth) async {
    int bestEval = -9999;
    Board? bestState;
    var states = await getNextStates();
    for (Board child in states) {
      //int eval = minimax(child, depth - 1, false);
      int eval = evaluate(child);
      if (eval > bestEval) {
        bestEval = eval;
        bestState = child;
      }
    }
    if (bestState != null) {
      return bestState;
    } else {
      print("no better state");
    }
    return null;
  }

  Future<Board?> doActionPc(int id, String action, Board state) async {
    if (remainingThrows > 0 || !validateAction(id, action, state)) return null;

    state = state.getNextState(actionValue[action]!, id, turn);
    eliminate(id, state);
    print("${state.player2} ${state.player1}");
    return state;
  }

  Future<List<Board>> getNextStates() async {
    Set<Board> res = {};
    List<String> copy = List.from(actions);
    //List<String> copy = ["تلاتة", "اربعة", "خال", "بنج", "دست", "خال"];
    List<List<String>> permutations = getPermutations(copy);

    Future<void> generate(int i, Board state, List<String> perm) async {
      print(i);
      if (i == copy.length || noActionAvailable(state)) {
        res.add(state);
        return;
      }
      for (int stone = 0; stone < 4; stone++) {
        print("in");
        Board? newState = await doActionPc(stone, perm[i], state);
        if (newState != null) generate(i + 1, newState, perm);
      }
    }

    int limit = permutations.length < 720 ? permutations.length : 720;
    for (int i = 0; i < limit; i++) {
      await generate(0, currentBoard, permutations[i]);
    }

    print(res);

    return res.toList();
  }

  void tst() {
    //List<String> list = ["تلاتة", "اربعة", "خال", "بنج", "دست", "خال"];
    //Permutations<String> permutations = Permutations(actions.length, actions);
    getNextStates();
  }

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

  int evaluate(Board state) {
    bool oneWon = state.player1.every((progress) => progress == 83);
    bool twoWon = state.player2.every((progress) => progress == 83);

    if (oneWon) return -1000;
    if (twoWon) return 1000;

    int player1Score = 0, player2Score = 0;
    player1Score += state.player1.sum.abs();
    player2Score += state.player2.sum.abs();
    // check if you can land on x
    // check if the stone has high progress

    // check if it has less -1 (to insure that he use خال for inserting stones & that you can kick out stones)
    for (int progress in state.player1) {
      if (progress != -1) player1Score += 40;
      if (progress == 83) player1Score += 30;
      if (progress != -1 && castle.contains(path1[progress])) player1Score += 25;
    }

    for (int progress in state.player2) {
      if (progress != -1) player2Score += 40;
      if (progress == 83) player2Score += 30;
      if (progress != -1 && castle.contains(path2[progress])) player2Score += 25;
    }

    return player2Score - player1Score;
  }
  // todo: make three difficulties
// todo: do report
}
