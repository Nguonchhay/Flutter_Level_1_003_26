import 'package:flutter/widgets.dart';

extension PaddingExtensions on Widget {
  /// Padding on all sides
  Widget padAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  /// Symmetric padding
  Widget padSymmetric({double vertical = 0.0, double horizontal = 0.0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        child: this,
      );

  /// Padding with custom sides
  Widget padOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) => Padding(
    padding: EdgeInsets.only(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    ),
    child: this,
  );
}
