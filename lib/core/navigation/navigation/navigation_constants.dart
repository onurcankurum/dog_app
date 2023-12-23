import 'package:flutter/material.dart';

import '../../../screens/bottom_navigation_group/bottom_navigation_group_page.dart';
import '../../../screens/bottom_navigation_group/home_page/home_page.dart';

enum NavigationConstant {
  homePage,
  bottomNavigationBarGroupPage;

  String get path {
    switch (this) {
      case bottomNavigationBarGroupPage:
        return '/bottom-navigation-bar-group-page';

      case homePage:
        return '/home-page';
    }
  }

  Widget Function(BuildContext) get widget {
    switch (this) {
      case homePage:
        return (context) => const HomePage();
      case bottomNavigationBarGroupPage:
        return (context) => const BottomNavigationGroupPage();
    }
  }

  static Map<String, Widget Function(BuildContext)> get routes =>
      values.fold<Map<String, Widget Function(BuildContext)>>(
        {},
        (previousValue, element) => {
          ...previousValue,
          element.path: element.widget,
        },
      );
}
