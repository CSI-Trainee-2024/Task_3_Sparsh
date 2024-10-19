// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:minesweeper/numberbox.dart';
import 'package:minesweeper/bomb.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int number_of_square=9*9;
  int number_ineach_row=9;
  var square_status=[];

  final List<int> bomb_location=[
    4,40,65
  ];

  @override
  void initState() {
    super.initState();

    for(int i=0;i<number_of_square;i++){
      square_status.add([0,false]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 150,
              color: Colors.grey.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "6",
                        style: TextStyle(fontSize: 40),
                      ),
                      Text("BOMB")
                    ],
                  ),
                  Card(
                      color: Colors.green,
                      child: Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 40,
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "0",
                        style: TextStyle(fontSize: 40),
                      ),
                      Text("TIME")
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: number_of_square,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: number_ineach_row),
                  itemBuilder: (context, index) {
                    if (bomb_location.contains(index)){
                      return Bomb(
                        child:index,
                        revealed: square_status[index][1],
                      );
                      
                    }
                      return Numberbox(
                        child: index,
                        revealed: square_status[index][1],
                      );

                  }),
            ),
          ],
        ),
      ),
    );
  }
}
