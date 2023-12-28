import 'package:algo_project/constants.dart';
import 'package:algo_project/ui/score_board.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController hC = Get.put(HomeController());

    Widget drawCell(int row, int column) {
      String type = hC.initBoard.cells[row][column];
      if (type == 'a' || type == '/') {
        return Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          //margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            //color: cellColor(hC.currentBoard.cells[i][j]),
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
            //color: cellColor(hC.currentBoard.cells[i][j]),
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
            //color: cellColor(hC.currentBoard.cells[i][j]),
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
      int gridStateLength = hC.initBoard.cells.length;
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridStateLength,
        ),
        itemBuilder: (BuildContext context, int index) {
          int gridStateLength = hC.initBoard.cells.length;
          int r, c = 0;
          r = (index / gridStateLength).floor();
          c = (index % gridStateLength);
          return GestureDetector(
            onTap: () {
              //_gridItemTapped(r, r);
              print("[$r,$c],");
            },
            child: Center(
              child: drawCell(r, c),
            ),
          );
        },
        itemCount: (gridStateLength) * (gridStateLength),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff232323),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            "لعبة برسيس",
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
            tooltip: "restart",
            onPressed: () {
              hC.restartGame();
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            tooltip: "restart",
            onPressed: () {
              hC.drawPath();
            },
            icon: const Icon(Icons.account_tree_sharp),
          ),
        ],
      ),
      backgroundColor: Color(0xFF121212),
      body: GetBuilder<HomeController>(
        builder: (con) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ScoreBoard(
                title: "اللاعب 1",
                iconData: Icons.person,
                active: hC.role,
                content: hC.actions,
                onPressed: () {
                  con.throwDice();
                },
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
                title: "اللاعب 2",
                iconData: Icons.computer,
                active: !hC.role,
                content: [],
                onPressed: () {},
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
