import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';

class MapLoader {
  static Future<List<Rect>> getObstaclesFromJson() async {
    final List<Rect> obstacles = [];
    String asset = 'assets/rayworld_collision_map.json';
    String data = await rootBundle.loadString(asset);
    final jsonData = jsonDecode(data);
    List objects = List.castFrom(jsonData['objects']);
    for (final object in objects) {
      obstacles.add(
        Rect.fromLTWH(
          object['x'],
          object['y'],
          object['width'],
          object['height'],
        ),
      );
    }
    return obstacles;
  }
}
