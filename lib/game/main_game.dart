import 'dart:ui';

import 'package:flame/game.dart';
import 'package:game_project/game/components/joypad.dart';
import 'package:game_project/game/components/player.dart';
import 'package:game_project/game/components/world.dart';

class MainGame extends FlameGame {
  Player player = Player();
  final World world = World();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(world);
    await add(player);
    player.position = world.size / 2;
    camera.followComponent(
      player,
      worldBounds: Rect.fromLTWH(
        0,
        0,
        world.size.x,
        world.size.y,
      ),
    );
  }

  void onDirectionChanged(Direction direction) {
    player.direction = direction;
  }
}
