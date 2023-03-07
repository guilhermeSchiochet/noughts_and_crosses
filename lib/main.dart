import 'package:flutter/material.dart';
import 'package:noughts_and_crosses/presentation/screens/game.dart';
import 'package:noughts_and_crosses/presentation/widgets/theme_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Game(),
      title: 'Tic-Tac-Toe',
      theme: ThemeApp.themeData,
    );
  }
}