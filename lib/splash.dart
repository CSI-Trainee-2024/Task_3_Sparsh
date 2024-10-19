// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:minesweeper/menu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _goToMenuPage();
    super.initState();
  }

  _goToMenuPage() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MenuPage()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "images/logo.png",
                color: Colors.grey,
              ),
            ),
            Center(
              child: Image.asset(
                "images/title.png",
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
