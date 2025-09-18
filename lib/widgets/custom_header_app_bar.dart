import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomHeaderAppBar - A customizable app bar component with menu, logo, search, and notification icons
 * 
 * This component provides a flexible app bar with consistent layout:
 * - Left side: Menu icon (hamburger menu)
 * - Center: Logo image
 * - Right side: Search and notification icons
 * 
 * Features:
 * - Responsive design using SizeUtils
 * - Customizable icon paths and callbacks
 * - Proper PreferredSizeWidget implementation
 * - Shadow and background color support
 * 
 * @param menuIconPath - Path to the menu icon (default: hamburger menu)
 * @param logoPath - Path to the logo image (required)
 * @param searchIconPath - Path to the search icon (default: search icon)
 * @param notificationIconPath - Path to the notification icon (default: bell icon)
 * @param backgroundColor - Background color of the app bar
 * @param onMenuTap - Callback when menu icon is tapped
 * @param onSearchTap - Callback when search icon is tapped
 * @param onNotificationTap - Callback when notification icon is tapped
 * @param height - Custom height for the app bar
 */
class CustomHeaderAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomHeaderAppBar({
    Key? key,
    this.menuIconPath,
    required this.logoPath,
    this.searchIconPath,
    this.notificationIconPath,
    this.backgroundColor,
    this.onMenuTap,
    this.onSearchTap,
    this.onNotificationTap,
    this.height,
  }) : super(key: key);

  /// Path to the menu icon image
  final String? menuIconPath;

  /// Path to the logo image (required)
  final String logoPath;

  /// Path to the search icon image
  final String? searchIconPath;

  /// Path to the notification icon image
  final String? notificationIconPath;

  /// Background color of the app bar
  final Color? backgroundColor;

  /// Callback function when menu icon is tapped
  final VoidCallback? onMenuTap;

  /// Callback function when search icon is tapped
  final VoidCallback? onSearchTap;

  /// Callback function when notification icon is tapped
  final VoidCallback? onNotificationTap;

  /// Custom height for the app bar
  final double? height;

  @override
  Size get preferredSize => Size.fromHeight(height ?? 80.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? Color(0xFFF9DECD),
      elevation: 0,
      toolbarHeight: height ?? 80.h,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Color(0xFFF9DECD),
          boxShadow: [
            BoxShadow(
              color: appTheme.color888888,
              offset: Offset(0, 4.h),
              blurRadius: 30.h,
              spreadRadius: 0,
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.h,
              vertical: 16.h,
            ),
            child: Row(
              children: [
                // Menu Icon
                GestureDetector(
                  onTap: onMenuTap,
                  child: CustomImageView(
                    imagePath: menuIconPath ?? ImageConstant.imgMenu,
                    height: 24.h,
                    width: 24.h,
                  ),
                ),

                // Spacer and Logo
                Expanded(
                  child: Center(
                    child: CustomImageView(
                      imagePath: logoPath,
                      height: 48.h,
                      width: 70.h,
                    ),
                  ),
                ),

                // Search Icon
                GestureDetector(
                  onTap: onSearchTap,
                  child: CustomImageView(
                    imagePath: searchIconPath ?? ImageConstant.imgSearch,
                    height: 24.h,
                    width: 24.h,
                  ),
                ),

                SizedBox(width: 28.h),

                // Notification Icon
                GestureDetector(
                  onTap: onNotificationTap,
                  child: CustomImageView(
                    imagePath:
                        notificationIconPath ?? ImageConstant.imgNotification,
                    height: 24.h,
                    width: 24.h,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
