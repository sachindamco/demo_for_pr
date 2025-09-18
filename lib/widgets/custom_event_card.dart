import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_button.dart';
import './custom_icon_button.dart';
import './custom_image_view.dart';

/** 
 * CustomEventCard - A comprehensive event card component that displays event information
 * including background image, status badge, title, location, date/time, and action buttons.
 * Supports flexible content and styling options with responsive design and customizable callbacks.
 * 
 * @param imagePath - Path to the event background image
 * @param title - Event title text
 * @param location - Event location text
 * @param dateTime - Event date and time text
 * @param statusBadgeText - Status badge text (e.g., "FILLING FAST", "SOLD OUT")
 * @param primaryButtonText - Text for the primary action button
 * @param secondaryButtonText - Text for the secondary action button
 * @param onInfoTap - Callback for info button tap
 * @param onPrimaryButtonTap - Callback for primary button tap
 * @param onSecondaryButtonTap - Callback for secondary button tap
 * @param showStatusBadge - Whether to show the status badge
 * @param showInfoButton - Whether to show the info button
 * @param backgroundColor - Background color of the card
 * @param borderColor - Border color of the card
 * @param margin - External margin of the card
 * @param padding - Internal padding of the card
 */
class CustomEventCard extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? location;
  final String? dateTime;
  final String? statusBadgeText;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  final VoidCallback? onInfoTap;
  final VoidCallback? onPrimaryButtonTap;
  final VoidCallback? onSecondaryButtonTap;
  final bool? showStatusBadge;
  final bool? showInfoButton;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String? locationIcon;
  final String? dateTimeIcon;
  final String? infoIcon;

  CustomEventCard({
    Key? key,
    this.imagePath,
    this.title,
    this.location,
    this.dateTime,
    this.statusBadgeText,
    this.primaryButtonText,
    this.secondaryButtonText,
    this.onInfoTap,
    this.onPrimaryButtonTap,
    this.onSecondaryButtonTap,
    this.showStatusBadge,
    this.showInfoButton,
    this.backgroundColor,
    this.borderColor,
    this.margin,
    this.padding,
    this.locationIcon,
    this.dateTimeIcon,
    this.infoIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: backgroundColor ?? Color(0xFFE8C6B1),
        border: Border.all(
          color: borderColor ?? Color(0xFFC7A18B),
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(16.h),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with status badge
          Stack(
            children: [
              CustomImageView(
                imagePath: imagePath ?? ImageConstant.imgImage,
                height: 184.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              if (showStatusBadge ?? true)
                Positioned(
                  top: 16.h,
                  right: 16.h,
                  child: CustomButton(
                    text: statusBadgeText ?? 'FILLING FAST',
                    buttonStyle: CustomButtonStyle.badge,
                    onPressed: null,
                  ),
                ),
            ],
          ),

          // Title and info button row
          Padding(
            padding: EdgeInsets.fromLTRB(16.h, 16.h, 16.h, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title ?? 'Rhythm with A.R. Rahman',
                    style: TextStyleHelper.instance.headline24BoldPhilosopher
                        .copyWith(height: 1.125),
                  ),
                ),
                if (showInfoButton ?? true)
                  CustomIconButton(
                    iconPath: infoIcon ?? ImageConstant.imgInfoChip,
                    height: 32.h,
                    width: 40.h,
                    backgroundColor: appTheme.deep_orange_100,
                    borderColor: appTheme.red_200,
                    borderWidth: 1.h,
                    borderRadius: 8.h,
                    padding: EdgeInsets.all(4.h),
                    onPressed: onInfoTap,
                  ),
              ],
            ),
          ),

          // Location row
          if (location != null)
            Padding(
              padding: EdgeInsets.fromLTRB(16.h, 16.h, 16.h, 0),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: locationIcon ?? ImageConstant.imgLocationIcon,
                    height: 24.h,
                    width: 24.h,
                  ),
                  SizedBox(width: 6.h),
                  Text(
                    location!,
                    style: TextStyleHelper.instance.body12MediumMontserrat
                        .copyWith(color: appTheme.gray_900, height: 1.25),
                  ),
                ],
              ),
            ),

          // Date time row
          if (dateTime != null)
            Padding(
              padding: EdgeInsets.fromLTRB(16.h, 4.h, 16.h, 0),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: dateTimeIcon ?? ImageConstant.imgDatetimeIcon,
                    height: 24.h,
                    width: 24.h,
                  ),
                  SizedBox(width: 8.h),
                  Text(
                    dateTime!,
                    style: TextStyleHelper.instance.body12MediumMontserrat
                        .copyWith(color: appTheme.gray_900, height: 1.25),
                  ),
                ],
              ),
            ),

          // Action buttons row
          Padding(
            padding: EdgeInsets.all(16.h),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: secondaryButtonText ?? 'View Details',
                    buttonStyle: CustomButtonStyle.secondary,
                    onPressed: onSecondaryButtonTap,
                  ),
                ),
                SizedBox(width: 12.h),
                Expanded(
                  child: CustomButton(
                    text: primaryButtonText ?? 'Book Now',
                    buttonStyle: CustomButtonStyle.primary,
                    onPressed: onPrimaryButtonTap,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
