import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bs.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController hC = Get.put(HomeController());

    Widget drawCell(String type) {
      //if (type == ' ') return const SizedBox.shrink();
      if (type == 'a' || type == 'k' || type == '/' || type == 'x') {
        return GestureDetector(
          onTap: () {
            //hC.click(i, j);
          },
          child: Container(
            width: 30,
            height: 25,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              //color: cellColor(hC.currentBoard.cells[i][j]),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color(0xFFD4AF37),
                width: 2,
              ),
            ),
          ),
        );
      }
      // if (type == 'k') {
      //   return GestureDetector(
      //     onTap: () {
      //       //hC.click(i, j);
      //     },
      //     child: Container(
      //       width: 30,
      //       height: 30,
      //       alignment: Alignment.center,
      //       margin: const EdgeInsets.all(1),
      //       decoration: BoxDecoration(
      //         //color: cellColor(hC.currentBoard.cells[i][j]),
      //         borderRadius: BorderRadius.circular(5),
      //         border: Border.all(
      //           color: Color(0xFFD4AF37),
      //           width: 2,
      //         ),
      //       ),
      //     ),
      //   );
      // }
      // if (type == 'x') {
      //   return MouseRegion(
      //     //cursor: hC.cells[i][j] == '@' ? SystemMouseCursors.click : SystemMouseCursors.basic,
      //     child: GestureDetector(
      //       onTap: () {
      //         //hC.click(i, j);
      //       },
      //       child: Container(
      //         width: 30,
      //         height: 25,
      //         alignment: Alignment.center,
      //         margin: const EdgeInsets.all(1),
      //         decoration: BoxDecoration(
      //           //color: cellColor(hC.currentBoard.cells[i][j]),
      //           borderRadius: BorderRadius.circular(5),
      //           border: Border.all(
      //             color: Color(0xFFD4AF37),
      //             width: 2,
      //           ),
      //         ),
      //         child: CustomPaint(
      //           painter: XPainter(),
      //         ),
      //       ),
      //     ),
      //   );
      // }
      return SizedBox(
        width: 30,
        height: 25,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff232323),
        centerTitle: true,
        title: const Text(
          "Barsis",
          style: TextStyle(
            letterSpacing: 5,
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
      backgroundColor: Colors.black,
      body: GetBuilder<HomeController>(
        builder: (con) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Column(
                    children: hC.cells.map((row) {
                      return Center(
                        child: Row(
                          children: row.map((item) {
                            return drawCell(item);
                          }).toList(),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
