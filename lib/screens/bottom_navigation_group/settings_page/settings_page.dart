import 'package:dog_app/core/enums/svg_enums.dart';
import 'package:dog_app/core/extension/theme_extension.dart';
import 'package:dog_app/core/theme/color.dart';
import 'package:dog_app/widget/atom/my_list_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/navigation/navigation/navigation_constants.dart';
import '../../../core/util/utils.dart';
import '../../mixin/base_view.dart';

final class SettingsPage extends StatefulWidget implements BaseView {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();

  @override
  NavigationConstant get navigationConstant => NavigationConstant.homePage;
}

final class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.antiFlashWhite,
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ListView(children: listViewTileItems),
        ));
  }

  List<Widget> get listViewTileItems => [
        MyListItemTile(
          leading: SvgPicture.asset(
            SvgEnums.info.path,
            height: 32,
            width: 32,
          ),
          trailing: SvgPicture.asset(
            SvgEnums.arrowRightUpIcon.path,
            height: 16,
            width: 16,
          ),
          title: Text(
            "Help",
            style: context.themeData.textTheme.bodyMedium
                ?.copyWith(color: Colors.black),
          ),
          hasDivider: true,
          onTap: () {},
        ),
        const _SettingsItemDivider(),
        MyListItemTile(
          leading: SvgPicture.asset(
            SvgEnums.starIcon.path,
            height: 32,
            width: 32,
          ),
          trailing: SvgPicture.asset(
            SvgEnums.starIcon.path,
            height: 16,
            width: 16,
          ),
          title: Text(
            "Rate Us",
            style: context.themeData.textTheme.bodyMedium
                ?.copyWith(color: Colors.black),
          ),
          hasDivider: true,
          onTap: () {},
        ),
        const _SettingsItemDivider(),
        MyListItemTile(
          leading: SvgPicture.asset(
            SvgEnums.shareIcon.path,
            height: 32,
            width: 32,
          ),
          trailing: SvgPicture.asset(
            SvgEnums.arrowRightUpIcon.path,
            height: 16,
            width: 16,
          ),
          title: Text(
            "Share With Friends",
            style: context.themeData.textTheme.bodyMedium
                ?.copyWith(color: Colors.black),
          ),
          hasDivider: true,
          onTap: () {},
        ),
        const _SettingsItemDivider(),
        MyListItemTile(
          leading: SvgPicture.asset(
            SvgEnums.termsOfUseIcon.path,
            height: 32,
            width: 32,
          ),
          trailing: SvgPicture.asset(
            SvgEnums.arrowRightUpIcon.path,
            height: 16,
            width: 16,
          ),
          title: Text(
            "Terms of Use",
            style: context.themeData.textTheme.bodyMedium
                ?.copyWith(color: Colors.black),
          ),
          hasDivider: true,
          onTap: () {},
        ),
        const _SettingsItemDivider(),
        MyListItemTile(
          leading: SvgPicture.asset(
            SvgEnums.privacyPolicyIcon.path,
            height: 32,
            width: 32,
          ),
          trailing: SvgPicture.asset(
            SvgEnums.arrowRightUpIcon.path,
            height: 16,
            width: 16,
          ),
          title: Text(
            "Privacy Policy",
            style: context.themeData.textTheme.bodyMedium
                ?.copyWith(color: Colors.black),
          ),
          hasDivider: true,
          onTap: () {},
        ),
        const _SettingsItemDivider(),
        MyListItemTile(
          leading: SvgPicture.asset(
            SvgEnums.osVersionIcon.path,
            height: 32,
            width: 32,
          ),
          trailing: Container(
            alignment: Alignment.centerRight,
            child: Flexible(
              child: Text(
                DeviceInfo.getOsVersion(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          title: Text(
            "Os Version",
            overflow: TextOverflow.ellipsis,
            style: context.themeData.textTheme.bodyMedium
                ?.copyWith(color: Colors.black),
          ),
          hasDivider: true,
          onTap: () {},
        ),
      ];
}

final class _SettingsItemDivider extends StatelessWidget {
  const _SettingsItemDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      height: 2,
      color: context.myTheme.settingListTileDividerColor,
    );
  }
}
