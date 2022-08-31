import 'package:flutter/material.dart';

class AppTextStyle {
  static const body1 = TextStyle(
    fontSize: 24,
  );
  static final body2 = body1.copyWith(fontSize: 18);
  static final body3Medium = body1.copyWith(fontSize: 14);
  static final body4Medium = body1.copyWith(fontSize: 12);
}
