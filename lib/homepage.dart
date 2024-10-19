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
    4,40,65,5,6,10
  ];
  bool bombs_revealed=false;

  @override
  void initState() {
    super.initState();

    for(int i=0;i<number_of_square;i++){
      square_status.add([0,false]);
    }
    scanbombs();
  }

  void reveal_box_numbers(int index){

    if (square_status[index][0]!= 0){
      setState(() {
      square_status[index][1] = true;
    });
  }

    else if( square_status[index][0]==0){
      setState(() {
        square_status[index][1] = true;

        if (index % number_ineach_row!= 0){
          if (square_status[index-1][0] == 0 && square_status[index-1][1] ==false){
            reveal_box_numbers(index-1);
          }
          square_status[index-1][1]=true;
        }

        if (index % number_ineach_row!= 0){
          if (square_status[index-1][0] == 0 && square_status[index-1][1] ==false){
            reveal_box_numbers(index-1);
          }
          square_status[index-1][1]=true;
        }


        if (index % number_ineach_row!= 0){
          if (square_status[index-1][0] == 0 && square_status[index-1][1] ==false){
            reveal_box_numbers(index-1);
          }
          square_status[index-1][1]=true;
        }



        
      });

    }
  }

      
    
    

  void refresh() {
    for(int i=0;i<number_of_square;i++){
      setState(() {
        square_status[i][1]=false;
      });    
    }

  }

  void scanbombs(){
    for(int i=0;i<number_of_square;i++){
      int numberOfBombAround= 0;

      if (bomb_location.contains(i-1) && i%number_ineach_row !=0){
        numberOfBombAround++;
      
    }
      if (bomb_location.contains(i-1-number_ineach_row)&& i%number_ineach_row !=0 && i>=number_ineach_row) {
        numberOfBombAround++;

      }
      if(bomb_location.contains(i-number_ineach_row)&& i>=number_ineach_row){
        numberOfBombAround++;

      }

      if(bomb_location.contains(i+1-number_ineach_row)&& i>=number_ineach_row && (i%number_ineach_row) !=(number_ineach_row-1)){
        numberOfBombAround++;

      }
      if(bomb_location.contains(i+1)&& (i%number_ineach_row) !=(number_ineach_row-1) ){
        numberOfBombAround++;
        
      }
      
      if(bomb_location.contains(i+1+number_ineach_row)&& (i%number_ineach_row) != (number_ineach_row-1) && i<(number_of_square-number_ineach_row)){
         numberOfBombAround++;
      }

      if(bomb_location.contains(i+number_ineach_row)&& i<(number_of_square-number_ineach_row)){
        numberOfBombAround++;
      }

      if(bomb_location.contains(i-1+number_ineach_row)&& i<(number_of_square-number_ineach_row) && (i%number_ineach_row) != 0){
         numberOfBombAround++;
      }

      setState(() {
        square_status[i][0]=numberOfBombAround;
      });


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
                        revealed: bombs_revealed,
                        function: (){
                         setState(() {
                           square_status[index][1] = true;
                           bombs_revealed=true;
                         });
                      
                        },
                      );
                      
                    }
                        return Numberbox(
                        child: square_status[index][0],
                        revealed: square_status[index][1],
                        function: () {
                          setState(() {
                            square_status[index][1] = true;
                          });

                        },
                      );

                  }),
            ),
          ],
        ),
      ),
    );
  }
}

