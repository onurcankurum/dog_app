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
        textTheme: TextTheme(
          headlineMedium: baseThemeData.textTheme.headlineMedium?.copyWith(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.05,
          ),
          bodyMedium: baseThemeData.textTheme.bodyMedium?.copyWith(
            color: AppColors.arsenic,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
        ),
        inputDecorationTheme: baseThemeData.inputDecorationTheme.copyWith(
          hintStyle: baseThemeData.inputDecorationTheme.hintStyle?.copyWith(
            color: AppColors.rifleGreeb,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
        ),
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
        settingListTileDividerColor: AppColors.platinum,
        breedCategoryItemBorderColor: AppColors.antiFlashWhite,
        breedCategoryItemTextBackgroundColor: Colors.black26,
        breedCategoryItemTextColor: Colors.white,
      );
}
