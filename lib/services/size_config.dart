import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double _width;
  static late double _height;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
  }

  static get height => _height;

  static get width => _width;
}
