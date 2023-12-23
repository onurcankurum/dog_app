import 'package:flutter/material.dart';
import '../../core/navigation/navigation/navigation_constants.dart';

mixin BaseView on Widget {
  NavigationConstant get navigationConstant;
}

mixin BaseStateMixin<T extends StatefulWidget> on State<T> {
  ThemeData get themeData => Theme.of(context);
  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;
  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;
}
