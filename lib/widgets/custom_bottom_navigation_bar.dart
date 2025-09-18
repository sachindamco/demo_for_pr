import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_icon_button.dart';
import './custom_image_view.dart';

/** 
 * CustomBottomNavigationBar - A bottom navigation bar component with floating action button.
 * Features a row of navigation items with icons and labels, plus a central floating action button.
 * Supports active/inactive states, custom styling, and flexible navigation callbacks.
 * 
 * @param bottomBarItems List of navigation items to display
 * @param selectedIndex Current selected index for active state
 * @param onItemTap Callback when navigation item is tapped
 * @param onFloatingButtonTap Callback when floating button is tapped
 * @param floatingButtonIcon Icon path for the floating button
 * @param backgroundColor Background color of the bottom bar
 * @param shadowColor Color of the drop shadow
 * @param activeTextColor Color for active item text
 * @param inactiveTextColor Color for inactive item text
 * @param floatingButtonColor Background color of floating button
 * @param floatingButtonBorderColor Border color of floating button
 */
class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({
    Key? key,
    required this.bottomBarItems,
    this.selectedIndex = 0,
    this.onItemTap,
    this.onFloatingButtonTap,
    this.floatingButtonIcon,
    this.backgroundColor,
    this.shadowColor,
    this.activeTextColor,
    this.inactiveTextColor,
    this.floatingButtonColor,
    this.floatingButtonBorderColor,
  }) : super(key: key);

  /// List of bottom navigation bar items
  final List<CustomBottomNavigationBarItem> bottomBarItems;

  /// Current selected index
  final int selectedIndex;

  /// Callback when navigation item is tapped
  final Function(int)? onItemTap;

  /// Callback when floating button is tapped
  final VoidCallback? onFloatingButtonTap;

  /// Icon path for floating button
  final String? floatingButtonIcon;

  /// Background color of the bottom bar
  final Color? backgroundColor;

  /// Color of the drop shadow
  final Color? shadowColor;

  /// Color for active item text
  final Color? activeTextColor;

  /// Color for inactive item text
  final Color? inactiveTextColor;

  /// Background color of floating button
  final Color? floatingButtonColor;

  /// Border color of floating button
  final Color? floatingButtonBorderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 268.h),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          // Bottom navigation bar
          Container(
              margin: EdgeInsets.only(top: 24.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: _buildNavigationItems()),
              padding: EdgeInsets.symmetric(horizontal: 36.h, vertical: 4.h)
                  .copyWith(bottom: 6.h),
              decoration: BoxDecoration(
                  color: backgroundColor ?? Color(0xBFE8C6B1),
                  border: Border(
                      top: BorderSide(color: appTheme.gray_600, width: 1.h)),
                  boxShadow: [
                    BoxShadow(
                        color: shadowColor ?? Color(0x88FF8888),
                        blurRadius: 30.h,
                        offset: Offset(0, 4.h)),
                  ])),
          // Floating action button
          Positioned(
              top: 0,
              child: CustomIconButton(
                  iconPath: floatingButtonIcon ?? ImageConstant.imgIcon,
                  height: 60.h,
                  width: 60.h,
                  backgroundColor: floatingButtonColor ?? Color(0xFF231E46),
                  borderColor: floatingButtonBorderColor ?? Color(0xFFFFF4ED),
                  borderWidth: 3.h,
                  borderRadius: 30.h,
                  padding: EdgeInsets.all(12.h),
                  iconSize: 24.h,
                  onPressed: onFloatingButtonTap)),
        ]));
  }

  /// Build list of navigation items with proper spacing for floating button
  List<Widget> _buildNavigationItems() {
    List<Widget> items = [];

    for (int i = 0; i < bottomBarItems.length; i++) {
      items.add(_buildNavigationItem(bottomBarItems[i], i));

      // Add spacer after second item (index 1) for floating button space
      if (i == 1) {
        items.add(SizedBox(width: 60.h)); // Space for floating button
      }
    }

    return items;
  }

  /// Build individual navigation item
  Widget _buildNavigationItem(CustomBottomNavigationBarItem item, int index) {
    final isSelected = selectedIndex == index;

    // Special case for text-only items (like "My E-card")
    if (item.iconPath == null) {
      return GestureDetector(
          onTap: () => onItemTap?.call(index),
          child: Container(
              margin: EdgeInsets.only(top: 6.h),
              child: Text(item.title,
                  style: TextStyleHelper.instance.label10MediumMontserrat
                      .copyWith(
                          color: _getTextColor(false, 0.7),
                          letterSpacing: 1,
                          height: 1.3))));
    }

    return GestureDetector(
        // Modified: Added missing parenthesis
        onTap: () => onItemTap?.call(index),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 4.h),
              child: CustomImageView(
                  imagePath: item.iconPath!,
                  height: 24.h, // Modified: Added missing height parameter
                  width: 24.h)),
          SizedBox(height: 6.h),
          Text(item.title,
              style: TextStyleHelper.instance.label10Montserrat.copyWith(
                  color: _getTextColor(isSelected, 1.0),
                  height:
                      1.3)), // Modified: Added missing opacity parameter and moved height to style
        ])); // Modified: Fixed parenthesis structure
  }

  /// Get text color based on selection state
  Color _getTextColor(bool isSelected, double opacity) {
    if (isSelected) {
      return activeTextColor ?? Color(0x7F262626);
    }
    return inactiveTextColor ??
        Color(0xFF262626).withOpacity(opacity); // Modified: Fixed color format
  }
}

/// Data model for bottom navigation bar items
class CustomBottomNavigationBarItem {
  CustomBottomNavigationBarItem({
    required this.title,
    this.iconPath,
    this.routeName,
  });

  /// Title text for the navigation item
  final String title;

  /// Icon path (null for text-only items)
  final String? iconPath;

  /// Route name for navigation (optional)
  final String? routeName;
}
