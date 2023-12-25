import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_app/core/extension/theme_extension.dart';
import 'package:dog_app/widget/atom/my_error_widget.dart';
import 'package:dog_app/widget/atom/my_place_holder.dart';
import 'package:flutter/material.dart';

class MyBreedCategoryItem extends StatelessWidget {
  const MyBreedCategoryItem(
      {super.key,
      required this.imageUrl,
      required this.text,
      required this.onTap});
  final String imageUrl;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onTap: onTap,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CachedNetworkImage(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: context.myTheme.breedCategoryItemBorderColor,
                          width: 1,
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                placeholder: (context, url) => const MyPlaceHolder(),
                errorWidget: (context, url, error) => const MyErroridget()),
            Positioned(
              left: 0,
              bottom: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: 38,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        color: context
                            .myTheme.breedCategoryItemTextBackgroundColor),
                    child: Center(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: context.myTheme.breedCategoryItemTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
