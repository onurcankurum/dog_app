import 'package:dog_app/core/navigation/navigation/navigation_constants.dart';
import 'package:dog_app/core/navigation/navigation/navigation_service.dart';
import 'package:dog_app/repository/dog_repository.dart';
import 'package:dog_app/screens/bottom_navigation_group/bottom_navigation_group_page.dart';
import 'package:dog_app/service/breed/dog_service.dart';
import 'package:flutter/material.dart';

import '../../core/enums/png_enums.dart';

import '../mixin/base_view.dart';

final class SplashPage extends StatefulWidget with BaseView {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();

  @override
  NavigationConstant get navigationConstant => NavigationConstant.splashPage;
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    doTasksAndGoHomePage();
    super.initState();
  }

  Future<void> doTasksAndGoHomePage() async {
    try {
      await DogRepository(DogService()).getBreeds();
      await DogRepository(DogService()).getImageForEachBreed();
      // ignore: use_build_context_synchronously
      await DogRepository(DogService()).cacheImageForEachBreed(context);
      NavigationService.instance.pushReplacement(
        baseView: const BottomNavigationGroupPage(),
      );
    } catch (e) {
      NavigationService.instance.push(
        baseView: const BottomNavigationGroupPage(),
      );
    }
    NavigationService.instance.push(
      baseView: const BottomNavigationGroupPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(PngEnums.frame.path)));
  }
}
