import 'package:flutter/material.dart';
import '../../core/navigation/navigation/navigation_constants.dart';

mixin BaseView on Widget {
  NavigationConstant get navigationConstant;
}
