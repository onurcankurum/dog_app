import 'dart:async';

import 'package:flutter/material.dart';

mixin OpenDialog on Widget {
  Future<void> showMyDialog(
          {required Widget child,
          required BuildContext Function() capturePageContext,
          EdgeInsets? padding}) async =>
      showDialog(
        context: capturePageContext(),
        builder: (context) => Dialog(
          insetPadding: padding,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          child: child,
        ),
      );
}
