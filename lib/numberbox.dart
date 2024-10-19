import 'package:flutter/material.dart';

class Numberbox extends StatelessWidget {
  final child;
  bool revealed;
  final Function;
  Numberbox({this.child, required this.revealed, this.Function});  
  




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Function,
      child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                color: Colors.blue,
                child: Center(child: Text(child.toString())),
              ),
            
      
      ),
    );
  }
}