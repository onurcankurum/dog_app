import 'package:dog_app/core/navigation/navigation/navigation_constants.dart';
import 'package:flutter/material.dart';

import '../../mixin/base_view.dart';

class HomePage extends StatefulWidget implements BaseView {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  NavigationConstant get navigationConstant => NavigationConstant.homePage;
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '2',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
