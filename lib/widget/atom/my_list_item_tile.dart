import 'package:flutter/material.dart';

class MyListItemTile extends StatelessWidget {
  const MyListItemTile({
    super.key,
    required this.trailing,
    required this.leading,
    required this.title,
    required this.hasDivider,
    required this.onTap,
  });
  final Widget trailing;
  final Widget leading;
  final Widget title;
  final bool hasDivider;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          leading,
          const SizedBox(
            width: 16,
          ),
          InkWell(child: title),
          Spacer(),
          trailing
        ]),
      ),
    );
  }
}
