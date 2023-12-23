import 'package:dog_app/core/enums/png_enums.dart';
import 'package:dog_app/core/navigation/navigation/navigation_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/enums/svg_enums.dart';
import '../../mixin/base_view.dart';

final class SettingsPage extends StatefulWidget implements BaseView {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();

  @override
  NavigationConstant get navigationConstant => NavigationConstant.homePage;
}

final class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.red, child: Image.asset(PngEnums.frame.path)));
  }
}
