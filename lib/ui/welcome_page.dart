import 'package:algo_project/constants.dart';
import 'package:algo_project/ui/difficulty_box.dart';
import 'package:algo_project/ui/home_page.dart';
import 'package:algo_project/ui/opponent_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../game_controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GameController gC = Get.put(GameController());
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: GetBuilder<GameController>(builder: (con) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OpponentBox(
                  active: !gC.computer,
                  content: Column(
                    children: [
                      Text(
                        "ضد لاعب آخر",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          letterSpacing: 0,
                          color: kNormalColor,
                        ),
                      ),
                      Icon(
                        Icons.person,
                        color: kNormalColor,
                        size: 100,
                      ),
                    ],
                  ),
                  onTap: () {
                    gC.setComputer(false);
                  },
                ),
                OpponentBox(
                  active: gC.computer,
                  content: Column(
                    children: [
                      Text(
                        "ضد الحاسوب",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          letterSpacing: 0,
                          color: kNormalColor,
                        ),
                      ),
                      Icon(
                        Icons.computer,
                        color: kNormalColor,
                        size: 100,
                      ),
                      const SizedBox(height: 16),
                      Visibility(
                        visible: gC.computer,
                        child: DifficultyBox(
                          title: "مستوى سهل",
                          color: Colors.lightGreenAccent,
                          info: "يتم اللعب عشوائياً بدون خوارزمية محددة, مما يجعل اللعب ضد الحاسوب سهل",
                          selected: gC.difficulty == 0,
                          onTap: () {
                            gC.setDifficulty(0);
                          },
                        ),
                      ),
                      Visibility(
                        visible: gC.computer,
                        child: DifficultyBox(
                          title: "مستوى متوسط",
                          color: Colors.orangeAccent,
                          info: "يتم توليد جميع الحالات التالية الممكنة (جميع التراتيب لجميع الاحجار والحركات "
                              "المتاحة)\n ثم اختيار الحالة الافضل للحاسوب من خلال تابع تقييم مناسب",
                          selected: gC.difficulty == 1,
                          onTap: () {
                            gC.setDifficulty(1);
                          },
                        ),
                      ),
                      Visibility(
                        visible: gC.computer,
                        child: DifficultyBox(
                          title: "مستوى صعب",
                          color: Colors.grey,
                          info: "قريباً",
                          selected: gC.difficulty == 2,
                          onTap: null,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    gC.setComputer(true);
                  },
                ),
              ],
            ),
            InkWell(
              onTap: () => Get.off(const HomePage()),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "ابدأ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: kNormalColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
