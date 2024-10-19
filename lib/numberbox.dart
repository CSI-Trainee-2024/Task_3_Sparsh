// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Numberbox extends StatelessWidget {
  final text;
  bool revealed;
  final function;
  Numberbox({super.key, this.text, required this.revealed, this.function});  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.all(2),
        color: revealed?  Colors.grey[300] : Colors.grey[500],
        child: Center(
          child: Text(
            revealed ? text.toString() :'',
          ),
        ),
      ),
    );
  }
}