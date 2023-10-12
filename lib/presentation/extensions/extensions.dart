import 'package:flutter/widgets.dart';

extension WidgetsExtension on Widget {
  Padding padding(EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }
}

extension SizedBoxWidgetDoubleExtension on double {
  SizedBox get w => SizedBox(width: this);
  SizedBox get h => SizedBox(height: this);
}

extension SizedBoxWidgetIntExtension on int {
  SizedBox get w => SizedBox(width: toDouble());
  SizedBox get h => SizedBox(height: toDouble());
}

extension IntExtension on int {
  String get formatted {
    return switch (this) {
      < 1000 => toString(),
      < 1000000 => '${(this / 1000).toStringAsFixed(1)}K',
      _ => '${(this / 1000000).toStringAsFixed(1)}M',
    };
  }
}
