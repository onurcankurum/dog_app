import 'package:flutter/material.dart';

import '../../../screens/mixin/base_view.dart';

final class NavigationService {
  const NavigationService._init();
  static const NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<T?> push<T extends Object?>({required BaseView baseView}) =>
      navigatorKey.currentState!
          .push<T>(_generateAdaptivePageRoute<T>(baseView));

  Future<T?> pushAndRemoveUntil<T extends Object?>({
    required BaseView baseView,
    String? stopRemovePath,
  }) =>
      navigatorKey.currentState!.pushAndRemoveUntil<T>(
          _generateAdaptivePageRoute<T>(baseView), (route) {
        if (stopRemovePath == null) return false;
        if (route is MaterialPageRoute) {
          if (route.settings.name.toString() == stopRemovePath) {
            return true;
          }
        }
        return false;
      });

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
          {required BaseView baseView}) =>
      navigatorKey.currentState!
          .pushReplacement<T, TO>(_generateAdaptivePageRoute<T>(baseView));

  Future<T?> pushNamed<T extends Object?>(String routeName,
          {Object? arguments}) =>
      navigatorKey.currentState!.pushNamed<T>(routeName, arguments: arguments);

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(String routeName,
          {Object? arguments}) =>
      navigatorKey.currentState!.pushNamedAndRemoveUntil<T>(
          routeName, (route) => false,
          arguments: arguments);

  bool get canPop => navigatorKey.currentState!.canPop();

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    Object? arguments,
  }) =>
      navigatorKey.currentState!
          .pushReplacementNamed<T, TO>(routeName, arguments: arguments);

  void pop<T extends Object?>([T? result]) =>
      navigatorKey.currentState!.pop<T>();

  Route<T> _generateAdaptivePageRoute<T extends Object?>(BaseView baseView) =>
      MaterialPageRoute<T>(
        builder: (context) => baseView,
        settings: RouteSettings(name: baseView.navigationConstant.path),
      );
}
