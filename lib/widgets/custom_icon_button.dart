import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * A customizable icon button component that supports various styling options
 * including background colors, borders, padding, and different shapes.
 * 
 * @param iconPath - Path to the icon image (SVG, PNG, etc.)
 * @param onPressed - Callback function when button is pressed
 * @param height - Height of the button
 * @param width - Width of the button
 * @param padding - Internal padding of the button
 * @param backgroundColor - Background color of the button
 * @param borderColor - Border color of the button
 * @param borderWidth - Width of the border
 * @param borderRadius - Border radius for rounded corners
 * @param iconSize - Size of the icon inside the button
 */
class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.iconPath,
    this.onPressed,
    this.height,
    this.width,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.iconSize,
  }) : super(key: key);

  /// Path to the icon image
  final String iconPath;

  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// Height of the button
  final double? height;

  /// Width of the button
  final double? width;

  /// Internal padding of the button
  final EdgeInsetsGeometry? padding;

  /// Background color of the button
  final Color? backgroundColor;

  /// Border color of the button
  final Color? borderColor;

  /// Width of the border
  final double? borderWidth;

  /// Border radius for rounded corners
  final double? borderRadius;

  /// Size of the icon inside the button
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40.h,
      width: width ?? 40.h,
      child: Material(
        color: appTheme.transparentCustom,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius ?? 8.h),
          child: Container(
            padding: padding ?? EdgeInsets.all(4.h),
            decoration: BoxDecoration(
              color: backgroundColor ?? Color(0xFFE8C6B1),
              border: Border.all(
                color: borderColor ?? Color(0xFFC7A18B),
                width: borderWidth ?? 1.h,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 8.h),
            ),
            child: Center(
              child: CustomImageView(
                imagePath: iconPath,
                height: iconSize ?? 24.h,
                width: iconSize ?? 24.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
