// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:minesweeper/numberbox.dart';
import 'package:minesweeper/bomb.dart';
import 'dart:math';

class Homepage extends StatefulWidget {
  Homepage({required this.numberofGrid, required this.level});

  int numberofGrid = 5;
  String level = "Easy";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int number_of_square = 25;
  int number_ineach_row = 5;
  var square_status = [];

  final List<int> bomb_location = [];
  bool bombs_revealed = false;

  @override
  void initState() {
    super.initState();
    number_of_square = widget.numberofGrid * widget.numberofGrid;
    number_ineach_row = widget.numberofGrid;
    generateBombLocations();
    generateSquareStatus();
    scanbombs();
  }

  void generateBombLocations() {
    int numberOfBombs = 0;
    if (widget.level == "Easy") {
      numberOfBombs = widget.numberofGrid;
    } else if (widget.level == "Medium") {
      numberOfBombs = widget.numberofGrid * 2;
    } else {
      numberOfBombs = widget.numberofGrid * 3;
    }

    Random random = Random();

    while (bomb_location.length < numberOfBombs) {
      var randomIndex = random.nextInt(number_of_square);
      if (bomb_location.contains(randomIndex)) {
      } else {
        bomb_location.add(randomIndex);
      }
    }
  }

  void generateSquareStatus() {
    for (int i = 0; i < number_of_square; i++) {
      square_status.add([0, false]);
    }
  }

  void reveal_box_numbers(int index) {
    //if box number is more than 0
    if (square_status[index][0] != 0) {
      setState(() {
        square_status[index][1] = true;
      });
    }

    // if box number is 0
    else if (square_status[index][0] == 0) {
      setState(() {
        square_status[index][1] = true;

        // for left boxes
        if (index % number_ineach_row != 0) {
          if (square_status[index - 1][0] == 0 &&
              square_status[index - 1][1] == false) {
            reveal_box_numbers(index - 1);
          }
          square_status[index - 1][1] = true;
        }

        //for right box
        if ((index + 1) % number_ineach_row != 0) {
          if (square_status[index + 1][0] == 0 &&
              square_status[index + 1][1] == false) {
            reveal_box_numbers(index + 1);
          }
          square_status[index + 1][1] = true;
        }

        //for upper box
        if (index >= number_ineach_row) {
          if (square_status[index - number_ineach_row][0] == 0 &&
              square_status[index - number_ineach_row][1] == false) {
            reveal_box_numbers(index - number_ineach_row);
          }
          square_status[index - number_ineach_row][1] = true;
        }

        //for lower box
        if (index <
            (number_ineach_row * number_ineach_row) - number_ineach_row) {
          if (square_status[index + number_ineach_row][0] == 0 &&
              square_status[index + number_ineach_row][1] == false) {
            reveal_box_numbers(index + number_ineach_row);
          }
          square_status[index + number_ineach_row][1] = true;
        }
      });
    }
  }

  void refresh() {
    for (int i = 0; i < number_of_square; i++) {
      setState(() {
        square_status[i][1] = false;
      });
    }
    setState(() {
      bombs_revealed = false;
    });
  }

  void scanbombs() {
    for (int i = 0; i < number_of_square; i++) {
      int numberOfBombAround = 0;
      
      //left box
      if (bomb_location.contains(i - 1) && i % number_ineach_row != 0) {
        numberOfBombAround++;
      }

      //top left box
      if (bomb_location.contains(i - 1 - number_ineach_row) &&
          i % number_ineach_row != 0 &&
          i >= number_ineach_row) {
        numberOfBombAround++;
      }

      //top box
      if (bomb_location.contains(i - number_ineach_row) &&
          i >= number_ineach_row) {
        numberOfBombAround++;
      }
 
      //top right box
      if (bomb_location.contains(i + 1 - number_ineach_row) &&
          i >= number_ineach_row &&
          ((i + 1)% number_ineach_row) != 0) {
        numberOfBombAround++;
      }
       
      //right box
      if (bomb_location.contains(i + 1) &&
          ((i + 1) % number_ineach_row) != 0) {
        numberOfBombAround++;
      }
      
      //bottom right box
      if (bomb_location.contains(i + 1 + number_ineach_row) &&
          ((i + 1) % number_ineach_row) != (number_ineach_row - 1) &&
          i < (number_of_square - number_ineach_row)) {
        numberOfBombAround++;
      }
      //ignoring last and first row of square 
      if (bomb_location.contains(i + number_ineach_row) &&
          i < (number_of_square - number_ineach_row)) {
        numberOfBombAround++;
      }
      
      //ignoring last  and left row of square
      if (bomb_location.contains(i - 1 + number_ineach_row) &&
          i < (number_of_square - number_ineach_row) &&
          (i % number_ineach_row) != 0) {
        numberOfBombAround++;
      }

      setState(() {
        square_status[i][0] = numberOfBombAround;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          bomb_location.length.toString(),
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        Text(
                          " TOTAL BOMBS",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: refresh,
                      child: Card(
                          color: Colors.green,
                          child: Icon(
                            Icons.refresh,
                            color: Colors.white,
                            size: 40,
                          )),
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
                      if (bomb_location.contains(index)) {
                        return Bomb(
                          revealed: bombs_revealed,
                          function: () {
                            setState(() {
                              square_status[index][1] = true;
                              bombs_revealed = true;
                            });
                          },
                        );
                      }
                      return Numberbox(
                          text: square_status[index][0] == 0
                              ? " "
                              : square_status[index][0],
                          revealed: square_status[index][1],
                          function: () => reveal_box_numbers(index));
                    }),
              ),
            ],
          ),
          bombs_revealed
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.85),
                )
              : Container(),
          bombs_revealed
              ? Center(
                  child: Container(
                    padding: EdgeInsets.all(30),
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Game Over!!",
                          style: TextStyle(fontSize: 40),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              bomb_location.clear();
                              square_status.clear();
                            });
                            generateBombLocations();
                            generateSquareStatus();
                            scanbombs();
                            setState(() {
                              bombs_revealed = false;
                            });
                          },
                          child: Card(
                              color: Colors.green,
                              child: Icon(
                                Icons.refresh,
                                color: Colors.white,
                                size: 40,
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              : Container()
        ],
      )),
    );
  }
}
