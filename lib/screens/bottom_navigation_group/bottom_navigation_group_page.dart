import 'package:dog_app/core/enums/svg_enums.dart';
import 'package:dog_app/core/navigation/navigation/navigation_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/color.dart';
import '../mixin/base_view.dart';
import 'home_page/home_page.dart';
import 'settings_page/settings_page.dart';

class BottomNavigationGroupPage extends StatefulWidget implements BaseView {
  const BottomNavigationGroupPage({super.key});

  @override
  State<BottomNavigationGroupPage> createState() =>
      _BottomNavigationGroupPageState();

  @override
  NavigationConstant get navigationConstant => throw UnimplementedError();
}

class _BottomNavigationGroupPageState extends State<BottomNavigationGroupPage> {
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
    var myBottomNavigationBar = Stack(
      children: [
        SvgPicture.asset(SvgEnums.bottomNavigationBarBackground.path,
            semanticsLabel: 'A red up arrow'),
        BottomNavigationBar(
          showSelectedLabels: false,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: myBottomNavigationBar,
    );
  }
}
