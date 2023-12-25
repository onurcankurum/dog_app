import 'package:dog_app/core/extension/theme_extension.dart';
import 'package:flutter/material.dart';

final class MyErroridget extends StatelessWidget {
  const MyErroridget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: context.myTheme.breedCategoryItemBorderColor,
            width: 1,
          ),
        ),
        child: const Icon(Icons.error));
  }
}
