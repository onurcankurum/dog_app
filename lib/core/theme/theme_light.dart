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
    return baseThemeData.copyWith();
  }
}
