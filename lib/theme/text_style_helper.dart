import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Headline Styles
  // Medium-large text styles for section headers

  TextStyle get headline24BoldPhilosopher => TextStyle(
        fontSize: 24.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Philosopher',
        color: appTheme.gray_900,
      );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body12MediumMontserrat => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
      );

  TextStyle get body14MediumMontserrat => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
      );

  // Label Styles
  // Small text styles for labels, captions, and hints

  TextStyle get label10MediumMontserrat => TextStyle(
        fontSize: 10.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
      );

  TextStyle get label10Montserrat => TextStyle(
        fontSize: 10.fSize,
        fontFamily: 'Montserrat',
      );

  // Other Styles
  // Miscellaneous text styles without specified font size

  TextStyle get textStyle6 => TextStyle();

  TextStyle get bodyTextMontserrat => TextStyle(
        fontFamily: 'Montserrat',
      );
}
