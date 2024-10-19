import 'package:flutter/material.dart';

class Bomb extends StatelessWidget {
  final child;
  final bool revealed;
  final function;

  Bomb({this.child, required this.revealed ,this.function} );  


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                color: revealed? Colors.green : Colors.red,
                child: Center(child: Text(child.toString())),
              ),
            
      
      ),
    );
  }
}
  

  