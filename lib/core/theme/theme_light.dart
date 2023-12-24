part of 'i_theme.dart';

class ThemeLight implements _ITheme {
  const ThemeLight();

  @override
  ThemeData get baseThemeData {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
    );
  }

  @override
  ThemeData get themeData => _themeData();

  ThemeData _themeData() {
    return baseThemeData.copyWith(
        dividerTheme: baseThemeData.dividerTheme.copyWith(
          color: AppColors.lightGray,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme:
            baseThemeData.bottomNavigationBarTheme.copyWith(
          backgroundColor: Colors.transparent,
          selectedIconTheme: const IconThemeData(
            color: AppColors.absoluteZero,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ));
  }

  @override
  get appExtensionsColors => const MyTheme(
        breedCategoryItemBorderColor: AppColors.antiFlashWhite,
        breedCategoryItemTextBackgroundColor: Colors.black26,
        breedCategoryItemTextColor: Colors.white,
      );
}
