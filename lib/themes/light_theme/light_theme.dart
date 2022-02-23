import 'package:africhange_screening/themes/colors/colors.dart';
import 'package:africhange_screening/themes/light_theme/text_theme/kLightTextTheme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme () {
  final baseTheme = ThemeData.light();

  return baseTheme.copyWith(
    // primaryColor: kAccentColor,
    colorScheme: ThemeData().colorScheme.copyWith(
      primary: kAccentColor,
    ),
    scaffoldBackgroundColor: kWhiteColor,
    textTheme: kLightTextTheme,
    // hintColor: kHintColor,
    // iconTheme: const IconThemeData(color: kShadowColor),
    focusColor: kAccentColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kAccentColor,
    ),
  );
}