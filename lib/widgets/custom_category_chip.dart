import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/** CustomCategoryChip - A reusable chip component for displaying categories with icons and labels. Features consistent styling with customizable content, text alignment, and optional width constraints. Perfect for category filters, tags, and navigation elements. */
class CustomCategoryChip extends StatelessWidget {
  CustomCategoryChip({
    Key? key,
    required this.iconPath,
    required this.text,
    this.onTap,
    this.textAlignment,
    this.width,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.iconSize,
    this.textStyle,
    this.padding,
    this.gap,
    this.isSelected = false,
  }) : super(key: key);

  /// Path to the SVG icon asset
  final String iconPath;

  /// Text label for the category
  final String text;

  /// Callback function when chip is tapped
  final VoidCallback? onTap;

  /// Text alignment within the chip
  final TextAlign? textAlignment;

  /// Optional fixed width for the chip
  final double? width;

  /// Background color of the chip
  final Color? backgroundColor;

  /// Border color of the chip
  final Color? borderColor;

  /// Border radius of the chip
  final double? borderRadius;

  /// Border width of the chip
  final double? borderWidth;

  /// Size of the icon
  final double? iconSize;

  /// Custom text style
  final TextStyle? textStyle;

  /// Internal padding of the chip
  final EdgeInsetsGeometry? padding;

  /// Gap between icon and text
  final double? gap;

  /// Whether the chip is in selected state
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: 6.h,
              horizontal: 10.h,
            ),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor ?? Color(0xFFC7A18B),
            width: borderWidth ?? 1.h,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 16.h),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: iconPath,
              height: iconSize ?? 24.h,
              width: iconSize ?? 24.h,
            ),
            SizedBox(height: gap ?? 4.h),
            Text(
              text,
              textAlign: textAlignment ?? TextAlign.left,
              style: textStyle ??
                  TextStyleHelper.instance.body12MediumMontserrat
                      .copyWith(color: appTheme.color7F2626),
            ),
          ],
        ),
      ),
    );
  }
}
