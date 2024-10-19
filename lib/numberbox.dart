import 'package:flutter/material.dart';

class Numberbox extends StatelessWidget {
  final child;
  bool revealed;
  final function;
  Numberbox({this.child, required this.revealed, this.function});  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                color: revealed?  Colors.blue : Colors.yellow,
                child: Center(
                  child: Text(
                    revealed ? child.toString() :'',
                  ),
                ),
              ),
            
      
      ),
    );
  }
}