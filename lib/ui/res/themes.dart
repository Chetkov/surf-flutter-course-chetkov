import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';

final lightTheme = ThemeData(
  sliderTheme: SliderThemeData(
    activeTrackColor: Colors.green,
    thumbColor: Colors.white,
    trackHeight: 2,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.green),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.green),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.green, width: 2),
    ),
  ),
);

final darkTheme = ThemeData(
    scaffoldBackgroundColor: darkMainBackgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkBottomNavigationBarBackgroundColor,
    ));
