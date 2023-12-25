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
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => AppColors.azure),
            foregroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.white),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(width: 0, color: Colors.transparent),
            ),
          ),
        ),
        textTheme: TextTheme(
          headlineMedium: baseThemeData.textTheme.headlineMedium?.copyWith(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.05,
          ),
          titleMedium: baseThemeData.textTheme.titleMedium?.copyWith(
            color: AppColors.absoluteZero,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
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
