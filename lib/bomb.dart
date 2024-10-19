// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Bomb extends StatelessWidget {
  final bool revealed;
  final function;

  const Bomb({super.key, required this.revealed, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(10),
        color: revealed ? Colors.black : Colors.grey[500],
        child: revealed ? Center(
            child: Image.asset(
              "images/bomb.png",
            ),
          ) : Container(),
      ),
    );
  }
}
