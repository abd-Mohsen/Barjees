import 'dart:math';

import 'package:algo_project/position.dart';
import 'package:algo_project/stone_model.dart';
import 'package:algo_project/ui/shell.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'board.dart';
import 'constants.dart';

class HomeController extends GetxController {
  // 19 * 19 grid
  // a for regular cell
  // x for x cell
  // k for kitchen cells
  // / for ...

  List<List<String>> initCells = [
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'x', 'a', 'x', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ['a', 'a', 'x', 'a', 'a', 'a', 'a', 'a', 'k', 'k', 'k', 'a', 'a', 'a', 'a', 'a', 'x', 'a', '/'],
    ['a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'k', 'k', 'k', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a'],
    ['/', 'a', 'x', 'a', 'a', 'a', 'a', 'a', 'k', 'k', 'k', 'a', 'a', 'a', 'a', 'a', 'x', 'a', 'a'],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'x', 'a', 'x', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  ];

  List<List<String>> deepCopyMatrix(List<List<String>> og) {
    List<List<String>> copy = [];

    for (List<String> row in og) {
      List<String> temp = [];
      for (String cell in row) {
        temp.add(cell);
      }
      copy.add(temp);
    }
    return copy;
  }

  late Board currentBoard;
  @override
  void onInit() {
    currentBoard = Board(
      player1: List.from(p1),
      player2: List.from(p2),
      cost: 1,
      depth: 0,
      heuristic: 0,
    );
    List<StoneModel> stones1 = List.generate(
      4,
      (i) => StoneModel(
        id: i,
        player: true,
      ),
    );
    List<StoneModel> stones2 = List.generate(
      4,
      (i) => StoneModel(
        id: i,
        player: false,
      ),
    );
    stones = [...stones1, ...stones2];
    super.onInit();
  }

  late List<StoneModel> stones;

  // is player1 turn
  bool turn = true;

  // path that player1 stones take to reach kitchen
  //todo: add final pos to path1 and path2
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

  // location of every player1 piece on path1
  List<int> p1 = [-1, -1, -1, -1];

  // location of every player2 pieces on path2
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
    "بنج": 24,
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

  List<String> actions = [];

  int remainingThrows = 1;

  //just a test, don't mind it
  void drawPath() async {
    for (Position pos in kitchen) {
      initCells[pos.r][pos.c] == ' ' || initCells[pos.r][pos.c] == 'k'
          ? initCells[pos.r][pos.c] = 'a'
          : initCells[pos.r][pos.c] = ' ';
      print("${pos.r},${pos.c}");
      await Future.delayed(const Duration(milliseconds: 200));
      update();
    }
  }

  void restartGame() {
    currentBoard = Board(
      player1: List.from(p1),
      player2: List.from(p2),
      cost: 1,
      depth: 0,
      heuristic: 0,
    );
    update();
  }

  void throwShells() {
    if (remainingThrows == 0) return;
    int res = randomWithProbability();
    List<Widget> shells = [];
    for (int i = 0; i < 6; i++) {
      shells.add(Shell(closed: i < res));
    }

    switch (res) {
      case 0:
        {
          remainingThrows++;
          actions.add("شكة"); // move 6
        }
      case 1:
        {
          remainingThrows++;
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
          remainingThrows++;
          actions.add("خال");
          actions.add("بنج"); // move 24
        }
      case 6:
        {
          remainingThrows++;
          actions.add("بارا"); // move 12
        }

      default:
        print("wtf");
    }
    remainingThrows--;
    // or if there is no valid action for all player's stones
    if (remainingThrows == 0 && (actions.isEmpty || noActionAvailable())) {
      print("after throw");
      actions.clear();
      turn = !turn;
      remainingThrows++;
    }
    update();
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 1),
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

  void doAction(int id, String action) {
    if (remainingThrows > 0 || !validateAction(id, action)) return;

    turn ? currentBoard.player1[id] += actionValue[action]! : currentBoard.player2[id] += actionValue[action]!;
    actions.remove(action);
    eliminate(id); // pass the id of the eliminator

    if (actions.isEmpty || noActionAvailable()) {
      turn = !turn;
      remainingThrows++;
      actions.clear();
    }
    update();
  }

  List<String> showActions(int id) {
    List<String> res = [];
    for (String action in actions.toSet()) {
      if (validateAction(id, action)) res.add(action);
    }
    print(res);
    return res;
  }

  bool validateAction(int id, String action) {
    int val = actionValue[action]!;
    int pos1 = currentBoard.player1[id];
    int pos2 = currentBoard.player2[id];
    // todo: fix index out of bound here: check if > 83 before
    bool outOfBounds = turn ? pos1 + val > 84 : pos2 + val > 84;
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

  bool eliminate(int id) {
    List<int> pos1 = currentBoard.player1;
    List<int> pos2 = currentBoard.player2;
    // check if those two lists are passed by val or ref
    Position pos = turn ? path1[pos1[id]] : path2[pos2[id]];
    if (opponentInCastle(pos)) return false;
    if (turn) {
      for (int i = 0; i < 4; i++) {
        if (pos2[i] != -1 && path2[pos2[i]] == pos) {
          pos2[i] = -1;
          return true;
        }
      }
      return false;
    }

    for (int i = 0; i < 4; i++) {
      if (pos1[i] != -1 && path1[pos1[i]] == pos) {
        pos1[i] = -1;
        return true;
      }
    }
    return false;
  }

  bool noActionAvailable() {
    for (String action in actions) {
      for (int i = 0; i < 4; i++) {
        if (validateAction(i, action)) {
          return false;
        }
      }
    }
    return true;
  }

  // print current state
  void printBoard() {
    for (List<String> row in initCells) {
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
      if (pos1[stone.id] == 83) continue;
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
      if (pos2[stone.id] == 83) continue;
      bool sameRow = (pos2[stone.id] == -1 ? r == 13 + stone.id : r == path2[pos2[stone.id]].r);

      bool sameColumn = (pos2[stone.id] == -1 ? c == 17 : c == path2[pos2[stone.id]].c);

      if (sameRow && sameColumn) res.add(stone);
    }
    return res;
  }
  // todo: arrange stones when they reach kitchen (or make stones disappear an put numbers in the middle)
}
