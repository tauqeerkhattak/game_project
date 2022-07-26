import 'dart:ui';

import 'package:flame/game.dart';
import 'package:game_project/game/components/joypad.dart';
import 'package:game_project/game/components/player.dart';
import 'package:game_project/game/components/world.dart';
import 'package:game_project/game/components/world_collidable.dart';
import 'package:game_project/services/map_loader.dart';

class MainGame extends FlameGame with HasCollisionDetection {
  Player player = Player();
  final World world = World();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(world);
    await add(player);
    await addCollisions();
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

  Future<void> addCollisions() async {
    List<Rect> obstacles = await MapLoader.getObstaclesFromJson();
    for (var i in obstacles) {
      WorldCollidable()
        ..position = Vector2(i.left, i.top)
        ..width = i.width
        ..height = i.height;
    }
  }
}
