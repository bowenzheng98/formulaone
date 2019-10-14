import 'package:flutter/widgets.dart';

class Styles{
  static const Color grey = Color(0xff616161);

  static const ColorFilter desaturatedColorFilter =
  // 222222 is a random color that has low color saturation.
  ColorFilter.mode(Color(0xFF222222), BlendMode.saturation);
}