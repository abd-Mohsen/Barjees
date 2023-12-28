import 'package:flutter/material.dart';

import '../constants.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    super.key,
    required this.title,
    required this.iconData,
    required this.content,
    required this.active,
    required this.onPressed,
  });

  final String title;
  final IconData iconData;
  final List<String> content;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
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
              itemCount: content.length,
              itemBuilder: (context, i) => Center(
                child: Text(
                  content[i],
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
            visible: active,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ElevatedButton(
                onPressed: onPressed,
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
        ],
      ),
    );
  }
}
