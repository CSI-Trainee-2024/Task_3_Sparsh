import 'package:flutter/material.dart';

class Bomb extends StatelessWidget {
  final bool revealed;
  final function;

  const Bomb({super.key,  required this.revealed ,this.function} );  


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                color: revealed? Colors.green : Colors.pink,     
            
      
              ),
      ),
    );
  }
}
  

  