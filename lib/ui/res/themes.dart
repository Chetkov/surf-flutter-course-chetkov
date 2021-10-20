import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';

final lightTheme = ThemeData();

final darkTheme = ThemeData(
  scaffoldBackgroundColor: darkMainBackgroundColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkBottomNavigationBarBackgroundColor,
  )
);