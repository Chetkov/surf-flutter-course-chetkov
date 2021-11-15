import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';

final lightTheme = ThemeData(
  sliderTheme: SliderThemeData(
    activeTrackColor: Colors.green,
    thumbColor: Colors.white,
    trackHeight: 2,
  )
);

final darkTheme = ThemeData(
  scaffoldBackgroundColor: darkMainBackgroundColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: darkBottomNavigationBarBackgroundColor,
  )
);