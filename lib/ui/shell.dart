import 'package:flutter/material.dart';

class Shell extends StatelessWidget {
  const Shell({super.key, required this.closed});
  final bool closed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: Image.asset(
        closed ? "assets/images/closed.png" : "assets/images/open.png",
      ),
    );
  }
}
