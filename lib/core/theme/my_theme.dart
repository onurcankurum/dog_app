import 'package:flutter/material.dart';

class MyTheme extends ThemeExtension<MyTheme> {
  const MyTheme({
    required this.breedCategoryItemBorderColor,
    required this.breedCategoryItemTextColor,
    required this.breedCategoryItemTextBackgroundColor,
    required this.settingListTileDividerColor,
  }) : super();

  final Color breedCategoryItemBorderColor;
  final Color breedCategoryItemTextColor;
  final Color breedCategoryItemTextBackgroundColor;
  final Color settingListTileDividerColor;

  @override
  ThemeExtension<MyTheme> copyWith({
    Color? breedCategoryItemBorderColor,
    Color? breedCategoryItemTextColor,
    Color? breedCategoryItemTextBackgroundColor,
    Color? settingListTileDividerColor,
  }) {
    return MyTheme(
      settingListTileDividerColor:
          settingListTileDividerColor ?? this.settingListTileDividerColor,
      breedCategoryItemTextBackgroundColor:
          breedCategoryItemTextBackgroundColor ??
              this.breedCategoryItemTextBackgroundColor,
      breedCategoryItemTextColor:
          breedCategoryItemTextColor ?? this.breedCategoryItemTextColor,
      breedCategoryItemBorderColor:
          breedCategoryItemBorderColor ?? this.breedCategoryItemBorderColor,
    );
  }

  @override
  ThemeExtension<MyTheme> lerp(
      covariant ThemeExtension<MyTheme>? other, double t) {
    return MyTheme(
      settingListTileDividerColor: Color.lerp(
              settingListTileDividerColor, settingListTileDividerColor, t) ??
          settingListTileDividerColor,
      breedCategoryItemTextColor: Color.lerp(
              breedCategoryItemTextColor, breedCategoryItemTextColor, t) ??
          breedCategoryItemTextColor,
      breedCategoryItemTextBackgroundColor: Color.lerp(
              breedCategoryItemTextBackgroundColor,
              breedCategoryItemTextBackgroundColor,
              t) ??
          breedCategoryItemTextBackgroundColor,
      breedCategoryItemBorderColor: Color.lerp(
              breedCategoryItemBorderColor, breedCategoryItemBorderColor, t) ??
          breedCategoryItemBorderColor,
    );
  }
}
