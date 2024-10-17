// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
                  itemCount: 25,
                  physics: NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(2),
                      alignment: Alignment.center,
                      width: 25,
                      height: 25,
                      color: Colors.blue,
                      child: Text(index.toString()),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
// Container(
//   height: 150,
//   color: Colors.red,
//   child: Container(
//     color: Colors.green,
//     child: const Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('6', style: TextStyle(fontSize: 40)),
//             Text('BOMB')
//           ],
//         )
//       ],
//     ),
//   ),
// )
