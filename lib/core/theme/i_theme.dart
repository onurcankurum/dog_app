import 'package:flutter/material.dart';

import 'color.dart';
part 'theme_light.dart';

abstract class _ITheme {
  ThemeData get baseThemeData;
  ThemeData get themeData;
}
