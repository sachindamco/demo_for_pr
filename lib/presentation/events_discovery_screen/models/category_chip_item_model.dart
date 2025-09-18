import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class CategoryChipItemModel extends Equatable {
  CategoryChipItemModel({
    this.iconPath,
    this.text,
    this.isSelected,
    this.textAlignment,
    this.width,
  }) {
    iconPath = iconPath ?? '';
    text = text ?? '';
    isSelected = isSelected ?? false;
    textAlignment = textAlignment ?? TextAlign.left;
  }

  String? iconPath;
  String? text;
  bool? isSelected;
  TextAlign? textAlignment;
  double? width;

  CategoryChipItemModel copyWith({
    String? iconPath,
    String? text,
    bool? isSelected,
    TextAlign? textAlignment,
    double? width,
  }) {
    return CategoryChipItemModel(
      iconPath: iconPath ?? this.iconPath,
      text: text ?? this.text,
      isSelected: isSelected ?? this.isSelected,
      textAlignment: textAlignment ?? this.textAlignment,
      width: width ?? this.width,
    );
  }

  @override
  List<Object?> get props => [iconPath, text, isSelected, textAlignment, width];
}
