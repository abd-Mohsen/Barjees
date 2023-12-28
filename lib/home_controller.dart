import 'dart:math';

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

  List<List<String>> getLevel(List<List<String>> level) {
    List<List<String>> copied = [];

    for (List<String> row in level) {
      List<String> temp = [];
      for (String cell in row) {
        temp.add(cell);
      }
      copied.add(temp);
    }
    return copied;
  }

  late Board initBoard;
  @override
  void onInit() {
    initBoard = Board(
      cells: getLevel(initCells),
      cost: 1,
      depth: 0,
      heuristic: 0,
    );
    super.onInit();
  }

  // is player1 role
  bool role = true;

  // path that player1 takes to reach kitchen
  final List<List<int>> path1 = [
    [9, 7],
    [9, 6],
    [9, 5],
    [9, 4],
    [9, 3],
    [9, 2],
    [9, 1],
    [9, 0],
    [8, 0],
    [8, 1],
    [8, 2],
    [8, 3],
    [8, 4],
    [8, 5],
    [8, 6],
    [8, 7],
    [7, 8],
    [6, 8],
    [5, 8],
    [4, 8],
    [3, 8],
    [2, 8],
    [1, 8],
    [0, 8],
    [0, 9],
    [0, 10],
    [1, 10],
    [2, 10],
    [3, 10],
    [4, 10],
    [5, 10],
    [6, 10],
    [7, 10],
    [8, 11],
    [8, 12],
    [8, 13],
    [8, 14],
    [8, 15],
    [8, 16],
    [8, 17],
    [8, 18],
    [9, 18],
    [10, 18],
    [10, 17],
    [10, 16],
    [10, 15],
    [10, 14],
    [10, 13],
    [10, 12],
    [10, 11],
    [11, 10],
    [12, 10],
    [13, 10],
    [14, 10],
    [15, 10],
    [16, 10],
    [17, 10],
    [18, 10],
    [18, 9],
    [18, 8],
    [17, 8],
    [16, 8],
    [15, 8],
    [14, 8],
    [13, 8],
    [12, 8],
    [11, 8],
    [10, 7],
    [10, 6],
    [10, 5],
    [10, 4],
    [10, 3],
    [10, 2],
    [10, 1],
    [10, 0],
    [9, 0],
    [9, 1],
    [9, 2],
    [9, 3],
    [9, 4],
    [9, 5],
    [9, 6],
    [9, 7],
  ];

  // path that player1 takes to reach kitchen
  final List<List<int>> path2 = [
    [9, 11],
    [9, 12],
    [9, 13],
    [9, 14],
    [9, 15],
    [9, 16],
    [9, 17],
    [9, 18],
    [10, 18],
    [10, 17],
    [10, 15],
    [10, 14],
    [10, 13],
    [10, 12],
    [10, 11],
    [11, 10],
    [12, 10],
    [13, 10],
    [14, 10],
    [15, 10],
    [16, 10],
    [17, 10],
    [18, 10],
    [18, 9],
    [18, 8],
    [17, 8],
    [16, 8],
    [15, 8],
    [14, 8],
    [12, 8],
    [11, 8],
    [10, 7],
    [10, 6],
    [10, 5],
    [10, 4],
    [10, 3],
    [10, 2],
    [10, 1],
    [10, 0],
    [9, 0],
    [8, 1],
    [4, 10],
    [5, 10],
    [6, 10],
    [7, 10],
    [8, 11],
    [8, 15],
    [9, 18],
    [9, 17],
    [9, 16],
    [9, 15],
    [9, 13],
    [9, 12],
    [9, 11],
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

  // x cells
  List<List<int>> castle = [
    [2, 10],
    [2, 8],
    [8, 2],
    [10, 2],
    [16, 8],
    [16, 10],
    [10, 16],
    [8, 16],
  ];

  // cells in the middle
  List<List<int>> inside = [
    [8, 10],
    [8, 9],
    [8, 8],
    [9, 10],
    [9, 9],
    [9, 8],
    [10, 10],
    [10, 9],
    [10, 8],
  ];

  void drawPath() async {
    for (List<int> coordinates in path2) {
      initBoard.cells[coordinates[0]][coordinates[1]] == ' ' || initBoard.cells[coordinates[0]][coordinates[1]] == 'k'
          ? initBoard.cells[coordinates[0]][coordinates[1]] = 'a'
          : initBoard.cells[coordinates[0]][coordinates[1]] = ' ';
      print("${coordinates[0]},${coordinates[1]}");
      await Future.delayed(Duration(milliseconds: 400));
      update();
    }
  }

  void restartGame() {
    initBoard = Board(
      cells: getLevel(initCells),
      cost: 1,
      depth: 0,
      heuristic: 0,
    );
    update();
  }

  int throwDice() {
    int res = Random().nextInt(7);
    print(throwName[res]);
    List<Widget> shells = [];
    for (int i = 0; i < 6; i++) {
      shells.add(Shell(closed: i < res));
    }
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 2),
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
    return res;
  }
}
