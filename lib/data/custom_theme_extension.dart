import 'package:flutter/material.dart';

extension CustomThemeData on ThemeData {

  Color get deactivatedCardColor => const Color(0xFF8D8E98);

  TextStyle cardLabelTextStyle({Color foregroundColor}) => TextStyle(
      fontSize: 18,
      color: foregroundColor ?? deactivatedCardForegroundColor
  );

  Color get deactivatedCardForegroundColor => Color(0xFF8D8E98);

  TextStyle get inputFieldTextStyle => TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold
  );

  /// Desired margin between input cards and screen border.
  /// Is divided into half each:
  /// <br>* margin of tiles gets 50%
  /// <br>* list padding gets 50%
  double get cardMargin => 16.0;

}