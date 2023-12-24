import 'package:flutter/material.dart';

import '../theme/i_theme.dart';
import '../theme/my_theme.dart';

extension ThemeExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);
  TextTheme get textTheme => themeData.textTheme;
  MyTheme get myTheme =>
      themeData.extension<MyTheme>() ?? const ThemeLight().appExtensionsColors;
}
