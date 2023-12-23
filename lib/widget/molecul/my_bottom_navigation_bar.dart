import 'package:dog_app/screens/mixin/base_view.dart';
import 'package:dog_app/widget/atom/my_bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';

import '../../core/enums/png_enums.dart';

final class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({
    super.key,
    required this.itemsIconsAndTexts,
    required this.onIndexChange,
    required this.currentIndex,
  });
  final List<MapEntry<String, String>> itemsIconsAndTexts;
  final Function(int) onIndexChange;
  final int currentIndex;

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar>
    with BaseStateMixin {
  int currentIndex = 0;
  @override
  void initState() {
    currentIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Ink(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          height: 98,
          width: dynamicWidth(1),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(PngEnums.bottomNavigationBarBackground.path),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var i = 0; i < widget.itemsIconsAndTexts.length; i++) ...[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widget.onIndexChange(i);
                          currentIndex = i;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: MyBottomNavBarItem(
                            iconSvgPath: widget.itemsIconsAndTexts[i].key,
                            title: widget.itemsIconsAndTexts[i].value,
                            iconColor: currentIndex == i
                                ? themeData.bottomNavigationBarTheme
                                    .selectedIconTheme?.color
                                : themeData.bottomNavigationBarTheme
                                    .unselectedIconTheme?.color),
                      ),
                    ),
                  ),
                  if (i != widget.itemsIconsAndTexts.length - 1)
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: themeData.dividerTheme.color),
                      height: 24,
                      width: 2,
                    )
                ]
              ]),
        ),
      ],
    );
  }
}
