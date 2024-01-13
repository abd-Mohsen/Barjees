import 'package:algo_project/constants.dart';
import 'package:algo_project/ui/score_board.dart';
import 'package:algo_project/ui/stone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../game_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GameController gC = Get.put(GameController());

    Widget drawCell(int row, int column) {
      String type = gC.cells[row][column];
      if (type == 'a' || type == '/') {
        return Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          //margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            //color: cellColor(gC.currentBoard.cells[i][j]),
            //borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: kMainColor,
              width: 1.2,
            ),
          ),
        );
      }
      if (type == 'k') {
        return Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          //margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            //color: cellColor(gC.currentBoard.cells[i][j]),
            //borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: kBoardColor,
              width: 1,
            ),
          ),
        );
      }
      if (type == 'x') {
        return Container(
          // width: row < 8 || row > 10 ? 30 : 20,
          // height: row < 8 || row > 10 ? 20 : 30,
          width: 30,
          height: 30,
          alignment: Alignment.center,
          //margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            //color: cellColor(gC.currentBoard.cells[i][j]),
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: kMainColor,
              width: 1.2,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.close,
              color: kMainColor,
              size: 23,
            ),
          ),
        );
      }
      return const SizedBox(
        width: 30,
        height: 30,
      );
    }

    Widget buildGameBody() {
      int rowsCount = gC.cells.length;
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: rowsCount,
        ),
        itemCount: (rowsCount) * (rowsCount),
        itemBuilder: (context, index) {
          int gridStateLength = gC.cells.length;
          int r, c = 0;
          r = (index / gridStateLength).floor();
          c = (index % gridStateLength);
          return GestureDetector(
            onTap: () {
              print("Position($r, $c),");
            },
            child: Center(
              child: Stack(
                children: [
                  drawCell(r, c),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...gC.getStones1(r, c).take(2).map((stone) => Stone(stone: stone)).toList(),
                            ...gC.getStones2(r, c).take(2).map((stone) => Stone(stone: stone)).toList(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (gC.getStones1(r, c).length > 2)
                              ...gC.getStones1(r, c).sublist(2).map((stone) => Stone(stone: stone)).toList(),
                            if (gC.getStones2(r, c).length > 2)
                              ...gC.getStones2(r, c).sublist(2).map((stone) => Stone(stone: stone)).toList(),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff232323),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            "برجيس",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: kMainColor,
              //wordSpacing: 20,
            ),
          ),
        ),
        actions: [
          IconButton(
            tooltip: "test path",
            onPressed: () async {
              await gC.getNextStates();
            },
            icon: const Icon(Icons.account_tree_sharp),
          ),
        ],
      ),
      backgroundColor: Color(0xFF121212),
      body: GetBuilder<GameController>(
        builder: (con) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ScoreBoard(
                title: "اللّاعب 1",
                iconData: Icons.person,
                player: true,
              ),
              Container(
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kBoardColor,
                  borderRadius: BorderRadius.circular(16),
                ),

                //height: 800,
                width: 560,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: kMainColor,
                      width: 3,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: buildGameBody(),
                  ),
                ),
              ),
              ScoreBoard(
                title: "اللّاعب 2",
                iconData: con.computer ? Icons.computer : Icons.person,
                player: false,
              ),
            ],
          );
        },
      ),
    );
  }
}

// Padding(
//   padding: const EdgeInsets.symmetric(vertical: 24),
//   child: Center(
//     child: Column(
//       children: hC.cells.map((row) {
//         return Center(
//           child: Row(
//             children: row.map((item) {
//               return drawCell(item);
//             }).toList(),
//           ),
//         );
//       }).toList(),
//     ),
//   ),
// ),
