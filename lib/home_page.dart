import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController hC = Get.put(HomeController());

    Widget drawCell(String type) {
      //if (type == ' ') return const SizedBox.shrink();
      if (type == 'a' || type == '/') {
        return Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            //color: cellColor(hC.currentBoard.cells[i][j]),
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: Color(0xFFD4AF37),
              width: 2,
            ),
          ),
        );
      }
      if (type == 'k') {
        return Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            //color: cellColor(hC.currentBoard.cells[i][j]),
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: Color(0xFFD4AF37),
              width: 2,
            ),
          ),
        );
      }
      if (type == 'x') {
        return Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            //color: cellColor(hC.currentBoard.cells[i][j]),
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: Color(0xFFD4AF37),
              width: 1.5,
            ),
          ),
          child: Center(
              child: Icon(
            Icons.close,
            color: Color(0xFFD4AF37),
            size: 22,
          )),
        );
      }
      return const SizedBox(
        width: 30,
        height: 30,
      );
    }

    Widget buildGameBody() {
      int gridStateLength = hC.cells.length;
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridStateLength,
        ),
        itemBuilder: (BuildContext context, int index) {
          int gridStateLength = hC.cells.length;
          int x, y = 0;
          x = (index / gridStateLength).floor();
          y = (index % gridStateLength);
          return GestureDetector(
            onTap: () {
              //_gridItemTapped(x, y);
              print("($x,$y)");
            },
            child: Center(
              child: drawCell(hC.cells[x][y]),
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
        title: const Text(
          "برسيس",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Color(0xFFD4AF37),
          ),
        ),
        actions: [
          IconButton(
            tooltip: "restart",
            onPressed: () {
              //
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: Color(0xFF121212),
      body: GetBuilder<HomeController>(
        builder: (con) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Color(0xFF3F0000),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Color(0xFFD4AF37),
                      width: 3,
                    )),

                //height: 800,
                width: 560,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: buildGameBody(),
                ),
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
