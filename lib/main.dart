import 'package:flutter/material.dart';
import 'package:wisata_web/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ('Tempat wisata'),
      theme: ThemeData(),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}