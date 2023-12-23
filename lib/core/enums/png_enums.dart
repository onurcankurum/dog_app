enum PngEnums {
  frame,
  bottomNavigationBarBackground;

  String get path {
    switch (this) {
      case frame:
        return 'assets/png/frame.png';
      case bottomNavigationBarBackground:
        return 'assets/png/bottom_navigation_bar_background.png';
    }
  }
}
