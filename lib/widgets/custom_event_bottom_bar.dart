import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomEventBottomBar - A bottom bar component that displays event information
 * including title, location, and date/time with an optional info button.
 * 
 * @param title - The main event title text
 * @param location - The venue or location text  
 * @param dateTime - The event date and time text
 * @param locationIcon - Path to the location icon image
 * @param dateTimeIcon - Path to the date/time icon image
 * @param infoIcon - Path to the info button icon image
 * @param onInfoTap - Callback function when info button is tapped
 * @param showInfoButton - Whether to display the info button
 * @param titleStyle - Custom text style for the title
 * @param detailStyle - Custom text style for location and date/time
 * @param infoButtonColor - Background color for the info button
 * @param infoButtonBorderColor - Border color for the info button
 * @param backgroundColor - Background color for the entire bottom bar
 * @param padding - Internal padding for the bottom bar
 * @param margin - External margin for the bottom bar
 */
class CustomEventBottomBar extends StatelessWidget {
  const CustomEventBottomBar({
    Key? key,
    this.title,
    this.location,
    this.dateTime,
    this.locationIcon,
    this.dateTimeIcon,
    this.infoIcon,
    this.onInfoTap,
    this.showInfoButton,
    this.titleStyle,
    this.detailStyle,
    this.infoButtonColor,
    this.infoButtonBorderColor,
    this.backgroundColor,
    this.padding,
    this.margin,
  }) : super(key: key);

  final String? title;
  final String? location;
  final String? dateTime;
  final String? locationIcon;
  final String? dateTimeIcon;
  final String? infoIcon;
  final VoidCallback? onInfoTap;
  final bool? showInfoButton;
  final TextStyle? titleStyle;
  final TextStyle? detailStyle;
  final Color? infoButtonColor;
  final Color? infoButtonBorderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 40.h),
      padding: padding ?? EdgeInsets.zero,
      decoration: backgroundColor != null
          ? BoxDecoration(color: backgroundColor)
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title and Info Button Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title ?? "Event Title",
                  style: titleStyle ??
                      TextStyleHelper.instance.headline24BoldPhilosopher
                          .copyWith(height: 1.125),
                ),
              ),
              if (showInfoButton ?? true) ...[
                SizedBox(width: 16.h),
                _buildInfoButton(),
              ],
            ],
          ),

          // Location Row
          if (location != null) ...[
            SizedBox(height: 16.h),
            _buildDetailRow(
              icon: locationIcon ?? ImageConstant.imgLocationIcon,
              text: location!,
              gap: 6.h,
            ),
          ],

          // Date Time Row
          if (dateTime != null) ...[
            SizedBox(height: 4.h),
            _buildDetailRow(
              icon: dateTimeIcon ?? ImageConstant.imgDatetimeIcon,
              text: dateTime!,
              gap: 8.h,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoButton() {
    return Container(
      width: 40.h,
      height: 32.h,
      decoration: BoxDecoration(
        color: infoButtonColor ?? Color(0xFFE8C6B1),
        border: Border.all(
          color: infoButtonBorderColor ?? Color(0xFFC7A18B),
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(8.h),
      ),
      child: IconButton(
        onPressed: onInfoTap,
        padding: EdgeInsets.all(4.h),
        icon: CustomImageView(
          imagePath: infoIcon ?? ImageConstant.imgInfoChip,
          height: 24.h,
          width: 24.h,
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required String icon,
    required String text,
    required double gap,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomImageView(
          imagePath: icon,
          width: 24.h,
          height: 24.h,
        ),
        SizedBox(width: gap),
        Text(
          text,
          style: detailStyle ??
              TextStyleHelper.instance.body12MediumMontserrat
                  .copyWith(color: appTheme.gray_900, height: 1.25),
        ),
      ],
    );
  }
}
