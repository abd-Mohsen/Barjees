import 'package:algo_project/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    super.key,
    required this.title,
    required this.iconData,
    required this.player,
  });

  final String title;
  final IconData iconData;
  final bool player;

  @override
  Widget build(BuildContext context) {
    GameController gC = Get.find();

    return GetBuilder<GameController>(builder: (con) {
      bool active = gC.turn == player;
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        width: 120,
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: 5,
            color: active ? kNormalColor : kNormalColor.withOpacity(0.3),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 8),
                Icon(
                  iconData,
                  color: active ? kNormalColor : kNormalColor.withOpacity(0.3),
                  size: 40,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    letterSpacing: 0,
                    color: active ? kNormalColor : kNormalColor.withOpacity(0.3),
                  ),
                ),
                Divider(
                  thickness: 5,
                  color: active ? kNormalColor : kNormalColor.withOpacity(0.3),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: active ? gC.actions.length : 0,
                itemBuilder: (context, i) => Center(
                  child: Text(
                    gC.actions[i],
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 0,
                      color: kNormalColor,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: active && !(gC.computer && !gC.turn),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Tooltip(
                  message: gC.remainingThrows > 0 ? "throw" : "do actions first",
                  child: MouseRegion(
                    cursor: gC.remainingThrows > 0 ? SystemMouseCursors.click : SystemMouseCursors.basic,
                    child: GestureDetector(
                      onTap: gC.remainingThrows > 0 && gC.throwCounter < 4 && !gC.halt
                          ? () async => await gC.throwShells()
                          : null,
                      child: Container(
                        decoration: BoxDecoration(
                          color: gC.remainingThrows > 0 && gC.throwCounter < 4 && !gC.halt
                              ? Colors.redAccent
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "ارمِ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: kNormalColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
