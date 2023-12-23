import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final class MyBottomNavBarItem extends StatelessWidget {
  const MyBottomNavBarItem(
      {super.key,
      required this.iconSvgPath,
      required this.title,
      required this.iconColor});
  final String iconSvgPath;
  final String title;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          iconSvgPath,
          width: 24,
          height: 24,
          colorFilter: iconColor != null
              ? ColorFilter.mode(
                  iconColor!,
                  BlendMode.srcIn,
                )
              : null,
        ),
        Text(title,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: iconColor,
                )),
      ],
    );
  }
}
