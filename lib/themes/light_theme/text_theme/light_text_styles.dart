import 'package:africhange_screening/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _primaryFontFamily = GoogleFonts.roboto();
final _secondaryFontFamily = GoogleFonts.montserratAlternates();

final kHeadLine1Style = _secondaryFontFamily.copyWith(
  fontSize: 40.0,
  fontWeight: FontWeight.w700,
  color: kSecondaryColor,
);

final kHeadLine6Style = _primaryFontFamily.copyWith(
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
  color: kAccentColor,
);

final kBodyText2Style = _primaryFontFamily.copyWith(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

final kButtonTextStyle = _primaryFontFamily.copyWith(
  fontSize: 16.0,
  fontWeight: FontWeight.w700,
  color: kWhiteColor,
);

