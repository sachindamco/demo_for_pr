import 'package:flutter/material.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = "lightCode";

  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  // App Colors
  Color get gray_800 => Color(0xFF49382B);
  Color get gray_900 => Color(0xFF262626);
  Color get red_600 => Color(0xFFE83D34);
  Color get red_100 => Color(0xFFF9DECD);
  Color get gray_600 => Color(0xFF90715F);
  Color get deep_orange_100 => Color(0xFFE8C6B1);
  Color get red_200 => Color(0xFFC7A18B);
  Color get blue_gray_900 => Color(0xFF231E46);
  Color get black_900_26 => Color(0x26000000);
  Color get red_50 => Color(0xFFFFF4ED);
  Color get white_A700 => Color(0xFFFFFFFF);

  // Additional Colors
  Color get transparentCustom => Colors.transparent;
  Color get blackCustom => Colors.black;
  Color get greyCustom => Colors.grey;
  Color get color7F2626 => Color(0x7F262626);
  Color get colorBF2626 => Color(0xBF262626);
  Color get colorBFE8C6 => Color(0xBFE8C6B1);
  Color get color88FF88 => Color(0x88FF8888);
  Color get color262626 => Color(0xFF262626);
  Color get colorFF9E9E => Color(0xFF9E9E9E);
  Color get color888888 => Color(0x88888888);

  // Color Shades - Each shade has its own dedicated constant
  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
}
