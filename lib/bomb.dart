import 'package:flutter/material.dart';

class Bomb extends StatelessWidget {
  final child;
  bool revealed;
  final Function;

  Bomb({this.child, required this.revealed ,this.Function} );  


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Function,
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
  

  