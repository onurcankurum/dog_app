enum SvgEnums {
  frame,
  homeIcon,
  settingsIcon,
  bottomNavigationBarBackground;

  String get path {
    switch (this) {
      case frame:
        return 'assets/svg/frame.svg';
      case bottomNavigationBarBackground:
        return 'assets/svg/bottom_navigation_bar_background.svg';
      case homeIcon:
        return 'assets/svg/home_icon.svg';
      case settingsIcon:
        return 'assets/svg/settings_icon.svg';
    }
  }
}
