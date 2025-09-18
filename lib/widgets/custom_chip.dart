import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/** CustomChip - A customizable chip component that displays an icon and text in a rounded container. Supports custom styling for background colors, borders, text styles, and dimensions. Perfect for tags, categories, filters, and status indicators with flexible theming options. */
class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    this.iconPath,
    this.text,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.borderRadius,
    this.borderWidth,
    this.fontSize,
    this.fontWeight,
    this.iconSize,
    this.gap,
    this.padding,
    this.margin,
    this.onTap,
    this.width,
    this.height,
  }) : super(key: key);

  /// Path to the icon/image to display
  final String? iconPath;

  /// Text content to display
  final String? text;

  /// Background color of the chip
  final Color? backgroundColor;

  /// Border color of the chip
  final Color? borderColor;

  /// Color of the text
  final Color? textColor;

  /// Border radius of the chip
  final double? borderRadius;

  /// Width of the border
  final double? borderWidth;

  /// Font size of the text
  final double? fontSize;

  /// Font weight of the text
  final FontWeight? fontWeight;

  /// Size of the icon
  final double? iconSize;

  /// Gap between icon and text
  final double? gap;

  /// Padding inside the chip
  final EdgeInsetsGeometry? padding;

  /// Margin around the chip
  final EdgeInsetsGeometry? margin;

  /// Callback function when chip is tapped
  final VoidCallback? onTap;

  /// Width of the chip
  final double? width;

  /// Height of the chip
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: width,
            height: height,
            margin: margin,
            padding: padding ??
                EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.h),
            decoration: BoxDecoration(
                border: Border.all(
                    color: borderColor ?? Color(0xFF90715F),
                    width: borderWidth ?? 1.h),
                borderRadius: BorderRadius.circular(borderRadius ?? 16.h)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (iconPath != null) ...[
                    CustomImageView(
                        imagePath: iconPath!,
                        height: iconSize ?? 24.h,
                        width: iconSize ?? 24.h),
                    SizedBox(height: gap ?? 4.h),
                  ],
                  if (text != null)
                    Text(text!,
                        style: TextStyleHelper.instance.bodyTextMontserrat
                            .copyWith(color: textColor ?? Color(0xFF49382B)),
                        textAlign: TextAlign.center),
                ])));
  }
}
