import 'package:flutter/material.dart';
import 'package:minesweeper/menu_new.dart';
import 'package:minesweeper/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xff3c3c3c)),
      home: const SplashScreen(),
    );
  }
}

