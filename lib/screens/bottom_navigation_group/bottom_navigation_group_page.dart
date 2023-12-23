import 'package:dog_app/core/enums/svg_enums.dart';
import 'package:dog_app/core/navigation/navigation/navigation_constants.dart';
import 'package:flutter/material.dart';

import '../../widget/molecul/my_bottom_navigation_bar.dart';
import '../mixin/base_view.dart';
import 'home_page/home_page.dart';
import 'settings_page/settings_page.dart';

final class BottomNavigationGroupPage extends StatefulWidget
    implements BaseView {
  const BottomNavigationGroupPage({super.key});

  @override
  State<BottomNavigationGroupPage> createState() =>
      _BottomNavigationGroupPageState();

  @override
  NavigationConstant get navigationConstant => throw UnimplementedError();
}

final class _BottomNavigationGroupPageState
    extends State<BottomNavigationGroupPage> with BaseStateMixin {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BottomNavigationBar Sample'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          itemsIconsAndTexts: [
            MapEntry(SvgEnums.homeIcon.path, 'Home'),
            MapEntry(SvgEnums.settingsIcon.path, 'Settings'),
          ],
          currentIndex: _selectedIndex,
          onIndexChange: _onItemTapped,
        ));
  }
}
