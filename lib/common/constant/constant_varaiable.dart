import 'dart:ui';

import 'package:flutter/material.dart';

const Color purpleButton1 = Color(0xFF8c54fd);
const Color purpleButton2 = Color(0xfff787ff);
const Color purpleButton3 = Color(0xff602bc1);
const Color primary = contentColorCyan;
const Color menuBackground = Color(0xFF090912);
const Color itemsBackground = Color(0xFF1B2339);
const Color pageBackground = Color(0xFF282E45);
const Color mainTextColor1 = Colors.white;
const Color mainTextColor2 = Colors.white70;
const Color mainTextColor3 = Colors.white38;
const Color mainGridLineColor = Colors.white10;
const Color borderColor = Colors.white54;
const Color gridLinesColor = Color(0x11FFFFFF);
const Color boxContentColor = Color(0xff3b3838);
const Color backgroundColor2 = Color(0xff1c1b21);
const Color backgroundColor = Color(0xFF14111c);
const Color contentColorBlack = Colors.black;
const Color contentColorWhite = Colors.white;
const Color contentColorBlue = Color(0xFF2196F3);
const Color contentColorYellow = Color(0xFFFFC300);
const Color contentColorOrange = Color(0xFFFF683B);
const Color contentColorGreen = Color(0xFF3BFF49);
const Color succeedColor = Color(0xff92d050);
const Color contentColorPurple = Color(0xFF6E1BFF);
const Color contentColorPink = Color(0xFFFF3AF2);
const Color contentColorRed = Color(0xFFE80054);
const Color contentColorCyan = Color(0xFF50E4FF);

extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      alpha,
      (red * value).round(),
      (green * value).round(),
      (blue * value).round(),
    );
  }

  Color lighten([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = percent / 100;
    return Color.fromARGB(
      alpha,
      (red + ((255 - red) * value)).round(),
      (green + ((255 - green) * value)).round(),
      (blue + ((255 - blue) * value)).round(),
    );
  }

  Color avg(Color other) {
    final red = (this.red + other.red) ~/ 2;
    final green = (this.green + other.green) ~/ 2;
    final blue = (this.blue + other.blue) ~/ 2;
    final alpha = (this.alpha + other.alpha) ~/ 2;
    return Color.fromARGB(alpha, red, green, blue);
  }
}
