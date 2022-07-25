import 'package:flutter/material.dart';
import 'package:game_project/screens/home/home.dart';

void main() {
  runApp(const GameProject());
}

class GameProject extends StatelessWidget {
  const GameProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
