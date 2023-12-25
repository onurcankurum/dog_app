enum SvgEnums {
  info,
  arrowRightUpIcon,
  osVersionIcon,
  privacyPolicyIcon,
  termsOfUseIcon,
  starIcon,
  shareIcon,
  frame,
  homeIcon,
  settingsIcon,
  bottomNavigationBarBackground;

  String get path {
    switch (this) {
      case info:
        return 'assets/svg/info.svg';
      case frame:
        return 'assets/svg/frame.svg';
      case bottomNavigationBarBackground:
        return 'assets/svg/bottom_navigation_bar_background.svg';
      case homeIcon:
        return 'assets/svg/home_icon.svg';
      case settingsIcon:
        return 'assets/svg/settings_icon.svg';
      case osVersionIcon:
        return 'assets/svg/os_version_icon.svg';
      case privacyPolicyIcon:
        return 'assets/svg/privacy_icon.svg';
      case termsOfUseIcon:
        return 'assets/svg/share_icon.svg';
      case starIcon:
        return 'assets/svg/star.svg';
      case shareIcon:
        return 'assets/svg/terms_of_use_icon.svg';
      case arrowRightUpIcon:
        return 'assets/svg/arrow_right_up.svg';
    }
  }
}
