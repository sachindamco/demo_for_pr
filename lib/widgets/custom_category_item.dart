import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomCategoryItem - A reusable category item component featuring a circular image and text label.
 * 
 * This component displays a category with a circular image and centered text below it.
 * Supports customizable styling, dimensions, and tap interactions for flexible category display needs.
 * 
 * @param imagePath - The path to the category image (required)
 * @param title - The category title text (required)
 * @param onTap - Optional callback when the category item is tapped
 * @param imageSize - Size of the circular image (default: 114.h)
 * @param spacing - Vertical spacing between image and text (default: 8.h)
 * @param textStyle - Custom text styling (default: Montserrat 14px medium)
 * @param textColor - Color of the category title text (default: appTheme.gray_900)
 * @param backgroundColor - Background color of the image container (default: transparent)
 * @param padding - Internal padding of the entire component (default: EdgeInsets.zero)
 * @param margin - External margin of the component (default: EdgeInsets.zero)
 */
class CustomCategoryItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback? onTap;
  final double? imageSize;
  final double? spacing;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CustomCategoryItem({
    Key? key,
    required this.imagePath,
    required this.title,
    this.onTap,
    this.imageSize,
    this.spacing,
    this.textStyle,
    this.textColor,
    this.backgroundColor,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveImageSize = imageSize ?? 114.h;
    final effectiveSpacing = spacing ?? 8.h;
    final effectiveTextColor = textColor ?? Color(0xFF262626);
    final effectivePadding = padding ?? EdgeInsets.zero;
    final effectiveMargin = margin ?? EdgeInsets.zero;

    final effectiveTextStyle =
        textStyle ?? TextStyleHelper.instance.body14MediumMontserrat;

    return Container(
      margin: effectiveMargin,
      padding: effectivePadding,
      decoration: backgroundColor != null
          ? BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8.h),
            )
          : null,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: effectiveImageSize,
              height: effectiveImageSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(effectiveImageSize / 2),
                boxShadow: [
                  BoxShadow(
                    color: appTheme.blackCustom.withAlpha(26),
                    blurRadius: 4.h,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(effectiveImageSize / 2),
                child: CustomImageView(
                  imagePath: imagePath,
                  width: effectiveImageSize,
                  height: effectiveImageSize,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: effectiveSpacing),
            Text(
              title,
              style: effectiveTextStyle,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
