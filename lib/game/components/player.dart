import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:game_project/game/components/joypad.dart';

class Player extends SpriteAnimationComponent with HasGameRef {
  Direction direction = Direction.none;
  final double playerSpeed = 150.0;
  final double animationSpeed = 0.15;
  late final SpriteAnimation rightAnimation;
  late final SpriteAnimation leftAnimation;
  late final SpriteAnimation upAnimation;
  late final SpriteAnimation downAnimation;
  late final SpriteAnimation standingAnimation;

  Player()
      : super(
          size: Vector2.all(50.0),
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // sprite = await gameRef.loadSprite('player.png');
    position = gameRef.size / 2;
    loadAnimations().then((value) {
      animation = standingAnimation;
    });
  }

  @override
  void update(double dt) {
    super.update(dt);
    movePlayer(dt);
  }

  void movePlayer(double delta) {
    switch (direction) {
      case Direction.up:
        animation = upAnimation;
        moveUp(delta);
        break;
      case Direction.down:
        animation = downAnimation;
        moveDown(delta);
        break;
      case Direction.left:
        animation = leftAnimation;
        moveLeft(delta);
        break;
      case Direction.right:
        animation = rightAnimation;
        moveRight(delta);
        break;
      case Direction.none:
        animation = standingAnimation;
        break;
    }
  }

  void moveUp(double delta) {
    position.add(Vector2(0, -delta * playerSpeed));
  }

  void moveDown(double delta) {
    position.add(Vector2(0, delta * playerSpeed));
  }

  void moveLeft(double delta) {
    position.add(Vector2(-delta * playerSpeed, 0));
  }

  void moveRight(double delta) {
    position.add(Vector2(delta * playerSpeed, 0));
  }

  Future<void> loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('player_spritesheet.png'),
      srcSize: Vector2(29.0, 32.0),
    );

    downAnimation = spriteSheet.createAnimation(
      row: 0,
      stepTime: animationSpeed,
      to: 4,
    );
    leftAnimation = spriteSheet.createAnimation(
      row: 1,
      stepTime: animationSpeed,
      to: 4,
    );
    upAnimation = spriteSheet.createAnimation(
      row: 2,
      stepTime: animationSpeed,
      to: 4,
    );
    rightAnimation = spriteSheet.createAnimation(
      row: 3,
      stepTime: animationSpeed,
      to: 4,
    );
    standingAnimation = spriteSheet.createAnimation(
      row: 0,
      stepTime: animationSpeed,
      to: 1,
    );
  }
}
