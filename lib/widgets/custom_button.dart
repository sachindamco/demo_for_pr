import 'package:flutter/material.dart';

import '../core/app_export.dart';

/**
 * CustomButton - A flexible button component supporting multiple styles and configurations
 * 
 * Supports three main variants:
 * - Primary: Filled button with shadow (for main actions like "Book Now")
 * - Secondary: Outlined button (for secondary actions like "View Details") 
 * - Badge: Small status indicators (like "FILLING FAST", "SOLD OUT")
 * 
 * @param text - Button text content
 * @param onPressed - Callback function when button is pressed
 * @param buttonStyle - Style variant (primary, secondary, badge)
 * @param width - Button width (null for auto-sizing)
 * @param height - Button height
 * @param backgroundColor - Background fill color
 * @param textColor - Text color
 * @param borderColor - Border color for outlined styles
 * @param borderRadius - Corner radius
 * @param fontSize - Text font size
 * @param fontWeight - Text font weight
 * @param textAlign - Text alignment
 * @param padding - Internal padding
 * @param margin - External margin
 * @param hasShadow - Whether to show box shadow
 * @param alignment - Button alignment within parent
 * @param isEnabled - Whether button is interactive
 */
class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.buttonStyle,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.padding,
    this.margin,
    this.hasShadow,
    this.alignment,
    this.isEnabled,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final CustomButtonStyle? buttonStyle;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool? hasShadow;
  final Alignment? alignment;
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        margin: margin,
        alignment: alignment,
        child: _buildButton(context));
  }

  Widget _buildButton(BuildContext context) {
    final effectiveButtonStyle = buttonStyle ?? CustomButtonStyle.primary;
    final effectiveIsEnabled = isEnabled ?? true;

    return Container(
        decoration: _getBoxDecoration(effectiveButtonStyle),
        child: Material(
            color: appTheme.transparentCustom,
            child: InkWell(
                onTap: effectiveIsEnabled ? onPressed : null,
                borderRadius: BorderRadius.circular(
                    _getBorderRadius(effectiveButtonStyle)),
                child: Container(
                    padding: _getPadding(effectiveButtonStyle),
                    child: Text(text,
                        textAlign: _getTextAlign(effectiveButtonStyle),
                        style: _getTextStyle(
                            effectiveButtonStyle, effectiveIsEnabled))))));
  }

  BoxDecoration _getBoxDecoration(CustomButtonStyle style) {
    return BoxDecoration(
        color: _getBackgroundColor(style),
        border: _getBorder(style),
        borderRadius: BorderRadius.circular(_getBorderRadius(style)),
        boxShadow: _getBoxShadow(style));
  }

  Color _getBackgroundColor(CustomButtonStyle style) {
    if (backgroundColor != null) return backgroundColor!;

    switch (style) {
      case CustomButtonStyle.primary:
        return Color(0xFF231E46);
      case CustomButtonStyle.secondary:
        return appTheme.transparentCustom;
      case CustomButtonStyle.badge:
        return Color(0xFFE8C6B1);
    }
  }

  Color _getTextColor(CustomButtonStyle style, bool isEnabled) {
    if (textColor != null) return textColor!;

    if (!isEnabled) return Color(0xFF9E9E9E);

    switch (style) {
      case CustomButtonStyle.primary:
        return Color(0xFFF9DECD);
      case CustomButtonStyle.secondary:
        return Color(0xFF49382B);
      case CustomButtonStyle.badge:
        return Color(0xFF49382B);
    }
  }

  Border? _getBorder(CustomButtonStyle style) {
    if (borderColor != null) {
      return Border.all(color: borderColor!, width: 1);
    }

    switch (style) {
      case CustomButtonStyle.primary:
        return null;
      case CustomButtonStyle.secondary:
        return Border.all(color: appTheme.gray_600, width: 1);
      case CustomButtonStyle.badge:
        return Border.all(color: appTheme.red_200, width: 1);
    }
  }

  double _getBorderRadius(CustomButtonStyle style) {
    if (borderRadius != null) return borderRadius!;

    switch (style) {
      case CustomButtonStyle.primary:
      case CustomButtonStyle.secondary:
        return 16.h;
      case CustomButtonStyle.badge:
        return 8.h;
    }
  }

  EdgeInsetsGeometry _getPadding(CustomButtonStyle style) {
    if (padding != null) return padding!;

    switch (style) {
      case CustomButtonStyle.primary:
      case CustomButtonStyle.secondary:
        return EdgeInsets.symmetric(vertical: 6.h, horizontal: 30.h);
      case CustomButtonStyle.badge:
        return EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.h);
    }
  }

  TextAlign _getTextAlign(CustomButtonStyle style) {
    if (textAlign != null) return textAlign!;
    return TextAlign.center;
  }

  double _getFontSize(CustomButtonStyle style) {
    if (fontSize != null) return fontSize!;

    switch (style) {
      case CustomButtonStyle.primary:
      case CustomButtonStyle.secondary:
        return 16.fSize;
      case CustomButtonStyle.badge:
        return 12.fSize;
    }
  }

  FontWeight _getFontWeight(CustomButtonStyle style) {
    if (fontWeight != null) return fontWeight!;
    return FontWeight.w500;
  }

  List<BoxShadow>? _getBoxShadow(CustomButtonStyle style) {
    if (hasShadow == false) return null;
    if (hasShadow == true || style == CustomButtonStyle.primary) {
      return [
        BoxShadow(
            color: appTheme.black_900_26, offset: Offset(0, 2), blurRadius: 6),
      ];
    }
    return null;
  }

  // Modified: Fixed method declaration and implementation
  TextStyle _getTextStyle(CustomButtonStyle style, bool isEnabled) {
    return TextStyleHelper.instance.label10Montserrat.copyWith(
      color: _getTextColor(style, isEnabled),
    );
  }
}

enum CustomButtonStyle {
  primary,
  secondary,
  badge,
}
