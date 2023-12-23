import 'package:dog_app/screens/bottom_navigation_group/home_page/home_page.dart';
import 'package:flutter/material.dart';

import 'core/navigation/navigation/navigation_constants.dart';
import 'core/navigation/navigation/navigation_service.dart';
import 'screens/bottom_navigation_group/bottom_navigation_group_page.dart';

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
      onGenerateTitle: (context) => 'Dog App',
      navigatorKey: NavigationService.navigatorKey,
      routes: NavigationConstant.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomNavigationGroupPage(),
    );
  }
}
