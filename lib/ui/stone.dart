import 'package:algo_project/constants.dart';
import 'package:algo_project/game_controller.dart';
import 'package:algo_project/stone_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';

class Stone extends StatelessWidget {
  final StoneModel stone;
  const Stone({super.key, required this.stone});

  @override
  Widget build(BuildContext context) {
    GameController gC = Get.find();
    //cursor: stone.player == hC.turn ? SystemMouseCursors.click : SystemMouseCursors.basic,
    return InkWell(
      onTap: stone.player != gC.turn || gC.halt
          ? null
          : () {
              if (stone.player != gC.turn) return;
              showPopover(
                context: context,
                bodyBuilder: (context) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "${gC.getPositions()[stone.id] + 1}/84",
                        style: TextStyle(
                          color: kNormalColor,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Divider(
                      color: kNormalColor,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: gC.showActions(stone.id).length,
                        itemBuilder: (context, i) => ListTile(
                          onTap: () async {
                            Get.back();
                            await gC.doAction(stone.id, gC.showActions(stone.id)[i]);
                          },
                          title: Center(
                            child: Text(
                              gC.showActions(stone.id)[i],
                              style: TextStyle(
                                color: kNormalColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                backgroundColor: const Color(0xff232323),
                direction: PopoverDirection.bottom,
                width: 150,
                height: 200,
                arrowHeight: 20,
                arrowWidth: 15,
              );
            },
      child: Icon(
        Icons.circle,
        size: 13.5,
        color: stone.player
            ? (gC.getPositions()[stone.id] > 74 ? Colors.indigoAccent.withOpacity(0.7) : Colors.indigoAccent)
            : (gC.getPositions()[stone.id] > 74 ? Colors.white.withOpacity(0.7) : Colors.white),
      ),
    );
  }
}
