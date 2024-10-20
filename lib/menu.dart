import 'package:flutter/material.dart';
import 'package:minesweeper/homepage.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuNewState();
}

class _MenuNewState extends State<Menu> {
  List<String> levels = ["Easy", "Medium", "Hard"];
  int selectedLevel = 0;

  List<int> grids = [5, 7, 9];
  int selectedgrid = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "images/logo.png",
                        height: MediaQuery.of(context).size.height / 8,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        "images/title.png",
                        height: MediaQuery.of(context).size.height / 8,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  //levels
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedLevel == 0) {
                                setState(() {
                                  selectedLevel = 2;
                                });
                              } else {
                                setState(() {
                                  selectedLevel--;
                                });
                              }
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey)),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.grey,
                              )),
                        ),
                        Text(
                          levels[selectedLevel],
                          style:
                              const TextStyle(fontSize: 30, color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (selectedLevel == 2) {
                              setState(() {
                                selectedLevel = 0;
                              });
                            } else {
                              setState(() {
                                selectedLevel++;
                              });
                            }
                          },
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey)),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.grey,
                              )),
                        ),
                      ]),

                  SizedBox(height: MediaQuery.of(context).size.height / 10),

                  //grids
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedgrid == 0) {
                                setState(() {
                                  selectedgrid = 2;
                                });
                              } else {
                                setState(() {
                                  selectedgrid--;
                                });
                              }
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey)),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.grey,
                              )),
                        ),
                        Text(
                          "${grids[selectedgrid].toString()} X ${grids[selectedgrid].toString()}",
                          style:
                              const TextStyle(fontSize: 30, color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (selectedgrid == 2) {
                              setState(() {
                                selectedgrid = 0;
                              });
                            } else {
                              setState(() {
                                selectedgrid++;
                              });
                            }
                          },
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey)),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.grey,
                              )),
                        ),
                      ]),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => Homepage(
                              numberofGrid: grids[selectedgrid],
                              level: levels[selectedLevel])),
                      (Route<dynamic> route) => false);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      border: Border.all(color: Colors.grey)),
                  child: const Text(
                    "Start Game",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
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
