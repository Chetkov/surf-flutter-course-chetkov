import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';

TextStyle _text = const TextStyle(
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      color: textColorPrimary,
    ),

//Regular
    textRegular = _text.copyWith(fontWeight: FontWeight.normal),
    textRegularSecondary = textRegular.copyWith(color: textColorSecondary),
    textRegularThird = textRegular.copyWith(color: textColorThird),
    textRegular14 = textRegular.copyWith(fontSize: 14),
    textRegular14Secondary = textRegular14.copyWith(color: textColorSecondary),
    textRegular14Third = textRegular14.copyWith(color: textColorThird),
    textRegular16 = textRegular.copyWith(fontSize: 16),
    textRegular16Secondary = textRegular16.copyWith(color: textColorSecondary),
    textRegular16Third = textRegular16.copyWith(color: textColorThird),
    textRegular18 = textRegular.copyWith(fontSize: 18),
    textRegular18Secondary = textRegular18.copyWith(color: textColorSecondary),
    textRegular18Third = textRegular18.copyWith(color: textColorThird),
    textRegular24 = textRegular.copyWith(fontSize: 24),
    textRegular24Secondary = textRegular24.copyWith(color: textColorSecondary),
    textRegular24Third = textRegular24.copyWith(color: textColorThird),

//w500
    text16w500 = _text.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
    text16w500Secondary = text16w500.copyWith(color: textColorSecondary),
    text24w500 = text16w500.copyWith(fontSize: 24),
    text24w500Secondary = text24w500.copyWith(color: textColorSecondary),

//Bold
    textBold = _text.copyWith(fontWeight: FontWeight.bold),
    textBold14 = textBold.copyWith(fontSize: 14),
    textBold24 = textBold.copyWith(fontSize: 24),
    textBold32 = textBold.copyWith(fontSize: 32);

