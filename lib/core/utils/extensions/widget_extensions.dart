import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Center get center => Center(child: this);

  Expanded get expanded => Expanded(child: this);
}
