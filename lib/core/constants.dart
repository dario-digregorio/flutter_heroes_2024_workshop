import 'package:flutter/widgets.dart';

enum ScreenSize {
  extraSmall(200),
  small(300),
  normal(400),
  large(600),
  extraLarge(1200);

  final double size;

  const ScreenSize(this.size);
}

ScreenSize getScreenSize(BuildContext context) {
  double deviceWidth = MediaQuery.sizeOf(context).shortestSide;
  if (deviceWidth > ScreenSize.extraLarge.size) return ScreenSize.extraLarge;
  if (deviceWidth > ScreenSize.large.size) return ScreenSize.large;
  if (deviceWidth > ScreenSize.normal.size) return ScreenSize.normal;
  return ScreenSize.small;
}

class Spacing {
  static const double extraSmall = 4;
  static const double small = 8;
  static const double normal = 16;
  static const double large = 24;
  static const double extraLarge = 32;
}
