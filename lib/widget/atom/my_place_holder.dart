import 'package:dog_app/core/extension/theme_extension.dart';
import 'package:flutter/material.dart';

final class MyPlaceHolder extends StatelessWidget {
  const MyPlaceHolder({super.key});

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
    );
  }
}
