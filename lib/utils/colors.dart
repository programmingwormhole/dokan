import 'package:flutter/material.dart';

class AppColors {
  // If anyone needs to change the app primary color, simply replace F75F55 with your desired color hex code.
  static const Color primary = Color(0xFFF75F55);
  static const Color scaffoldBackground = Color(0xFFF8F8F8);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color appBarText = Color(0xFF222455);

  static const LinearGradient gradient = LinearGradient(
    colors: [
      Color(0xFFF2709C),
      Color(0xFFFF9472),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
