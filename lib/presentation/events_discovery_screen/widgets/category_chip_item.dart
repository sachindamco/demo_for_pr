import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_category_chip.dart';
import '../models/category_chip_item_model.dart';

class CategoryChipItem extends StatelessWidget {
  final CategoryChipItemModel categoryChipItemModel;
  final VoidCallback? onTap;

  CategoryChipItem({
    Key? key,
    required this.categoryChipItemModel,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCategoryChip(
      iconPath: categoryChipItemModel.iconPath ?? '',
      text: categoryChipItemModel.text ?? '',
      textAlignment: categoryChipItemModel.textAlignment ?? TextAlign.left,
      width: categoryChipItemModel.width,
      backgroundColor: (categoryChipItemModel.isSelected ?? false)
          ? Color(0xFFE8C6B1)
          : appTheme.transparentCustom,
      textStyle: TextStyleHelper.instance.body12MediumMontserrat.copyWith(
          color: (categoryChipItemModel.isSelected ?? false)
              ? Color(0xFF49382B)
              : appTheme.color7F2626),
      onTap: onTap,
      isSelected: categoryChipItemModel.isSelected ?? false,
    );
  }
}
