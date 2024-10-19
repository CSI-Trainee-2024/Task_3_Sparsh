import 'package:flutter/material.dart';
import 'package:minesweeper/homepage.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int numberofGrid = 5;
  String level = "Easy";


  _changeNumberOfBombs(int bombs){
    setState(() {
      numberofGrid
   = bombs;
    });
  }

  _changelevelofgame(String levels){
    setState(() {
      level=levels;
    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Image.asset(
                  "images/title.png",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () => _changeNumberOfBombs(5),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              numberofGrid
                           == 5 ? Colors.green : Colors.grey),                        
                      child: const Text("5X5",style: TextStyle(color:  Colors.white))),
                  ElevatedButton(
                      onPressed: () => _changeNumberOfBombs(9),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              numberofGrid
                           == 9 ? Colors.green : Colors.grey),
                      child: const Text("9X9",style: TextStyle(color:  Colors.white)))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () => _changelevelofgame("Easy"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: level=="Easy" ? Colors.green :  Colors.grey,


                  ),
                   child: const Text("Easy",style: TextStyle(color:  Colors.white))),

                   ElevatedButton(onPressed: () => _changelevelofgame("Medium"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: level=="Medium" ? Colors.green :  Colors.grey,


                  ),
                   child: const Text("Medium",style: TextStyle(color:  Colors.white))),

                   ElevatedButton(onPressed: () => _changelevelofgame("Hard"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: level=="Hard" ? Colors.green :  Colors.grey,


                  ),
                   child: const Text("Hard",style: TextStyle(color:  Colors.white)))
                  
                ],
              ),
              GestureDetector(
                onTap: () {
                  print(numberofGrid);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Homepage(numberofGrid,level)),
                      (Route<dynamic> route) => false);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(1000)),
                  child: const Text(
                    "Start Game",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
