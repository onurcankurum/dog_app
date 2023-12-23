import 'package:dog_app/core/theme/i_theme.dart';
import 'package:flutter/material.dart';

import 'core/navigation/navigation/navigation_constants.dart';
import 'core/navigation/navigation/navigation_service.dart';
import 'screens/bottom_navigation_group/bottom_navigation_group_page.dart';
import 'screens/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dog App',
      navigatorKey: NavigationService.navigatorKey,
      routes: NavigationConstant.routes,
      theme: const ThemeLight().themeData,
      home: const SplashPage(),
    );
  }
}
