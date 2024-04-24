import 'package:algo_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DifficultyBox extends StatelessWidget {
  final String title;
  final Color color;
  final String info;
  final bool selected;
  final void Function()? onTap;

  const DifficultyBox({
    super.key,
    required this.title,
    required this.color,
    required this.info,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 200,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        decoration: BoxDecoration(
          color: color,
          border: selected
              ? Border.all(
                  width: 5,
                  color: kNormalColor,
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "طريقة اللعب",
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(info),
                    ),
                  );
                },
                icon: Icon(Icons.info_outline)),
          ],
        ),
      ),
    );
  }
}
