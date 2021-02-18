import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';

TextStyle _text = const TextStyle(
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      color: textColorPrimary,
    ),

//Regular
    textRegular = _text.copyWith(fontWeight: FontWeight.normal),
    textRegular14 = textRegular.copyWith(fontSize: 14),
    textRegular14Secondary = textRegular14.copyWith(color: textColorSecondary),

//Bold
    textBold = _text.copyWith(fontWeight: FontWeight.bold),
    textBold14 = textBold.copyWith(fontSize: 14),
    textBold24 = textBold.copyWith(fontSize: 24),
    textBold32 = textBold.copyWith(fontSize: 32);

