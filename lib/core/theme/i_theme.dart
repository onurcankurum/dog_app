import 'package:dog_app/core/theme/my_theme.dart';
import 'package:flutter/material.dart';

import 'color.dart';
part 'theme_light.dart';

abstract class _ITheme {
  ThemeData get baseThemeData;
  ThemeData get themeData;
  MyTheme get appExtensionsColors;
}
