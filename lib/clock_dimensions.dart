import 'dart:ui';

class ClockDimensions {
  final double x;
  final double y;
  final double circumference;

  ClockDimensions(this.x, this.y, this.circumference);

  Offset get offset => Offset(x, y);

  Offset get offsetCircumference => Offset(0, circumference);
}
