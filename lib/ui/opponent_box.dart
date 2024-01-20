import 'package:flutter/material.dart';

import '../constants.dart';

class OpponentBox extends StatelessWidget {
  final bool active;
  final Widget content;
  final void Function() onTap;
  const OpponentBox({
    super.key,
    required this.active,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 400,
        width: 400,
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          border: Border.all(
            width: 5,
            color: active ? kNormalColor : kNormalColor.withOpacity(0.3),
          ),
        ),
        child: Center(child: content),
      ),
    );
  }
}
