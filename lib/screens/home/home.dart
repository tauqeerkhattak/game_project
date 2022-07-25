import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game_project/game/components/joypad.dart';
import 'package:game_project/game/main_game.dart';
import 'package:game_project/services/size_config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MainGame game = MainGame();
  Direction direction = Direction.none;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Stack(
        children: [
          GameWidget(
            game: game,
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: JoyPad(
              onDirectionChanged: onDirectionChanged,
            ),
          ),
        ],
      ),
    );
  }

  void onDirectionChanged(Direction direction) {
    game.onDirectionChanged(direction);
  }
}
