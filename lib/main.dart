import 'package:flutter/material.dart';
import 'package:flutter_pokedex/screen/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(primaryColor: Color(0xFFE42F2C)),
      home: HomeScreen(),
    );
  }
}
