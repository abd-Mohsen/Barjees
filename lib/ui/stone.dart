import 'package:algo_project/home_controller.dart';
import 'package:algo_project/stone_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';

class Stone extends StatelessWidget {
  final StoneModel stone;
  const Stone({super.key, required this.stone});

  @override
  Widget build(BuildContext context) {
    HomeController hC = Get.find();
    return GestureDetector(
      onTap: () {
        if (stone.player != hC.turn) return;
        showPopover(
          context: context,
          bodyBuilder: (context) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${hC.getPositions()[stone.id] + 1}/84",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: hC.showActions(stone.id).length,
                  itemBuilder: (context, i) => hC.showActions(stone.id).isEmpty
                      ? Text(
                          "ليس هناك حركة متاحة",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                          ),
                        )
                      : ListTile(
                          onTap: () {
                            hC.doAction(stone.id, hC.showActions(stone.id)[i]);
                            Get.back();
                          },
                          title: Center(
                            child: Text(hC.showActions(stone.id)[i]),
                          ),
                        ),
                ),
              ),
            ],
          ),
          direction: PopoverDirection.bottom,
          width: 150,
          height: 200,
          arrowHeight: 15,
          arrowWidth: 30,
        );
      },
      child: Icon(
        Icons.star,
        size: 13,
        color: stone.player ? Colors.black : Colors.white,
      ),
    );
  }
}
