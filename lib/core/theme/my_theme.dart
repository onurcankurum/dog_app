import 'package:flutter/material.dart';

class MyTheme extends ThemeExtension<MyTheme> {
  const MyTheme({
    required this.breedCategoryItemBorderColor,
    required this.breedCategoryItemTextColor,
    required this.breedCategoryItemTextBackgroundColor,
  }) : super();

  final Color breedCategoryItemBorderColor;
  final Color breedCategoryItemTextColor;
  final Color breedCategoryItemTextBackgroundColor;

  @override
  ThemeExtension<MyTheme> copyWith({
    Color? breedCategoryItemBorderColor,
  }) {
    return MyTheme(
      breedCategoryItemTextBackgroundColor:
          breedCategoryItemTextBackgroundColor,
      breedCategoryItemTextColor: breedCategoryItemTextColor,
      breedCategoryItemBorderColor:
          breedCategoryItemBorderColor ?? this.breedCategoryItemBorderColor,
    );
  }

  @override
  ThemeExtension<MyTheme> lerp(
      covariant ThemeExtension<MyTheme>? other, double t) {
    return MyTheme(
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
