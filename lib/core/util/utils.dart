import 'dart:io';

final class DeviceInfo {
  static String getOsVersion() {
    final String os = Platform.operatingSystem;
    List<String?> versionProperties =
        Platform.operatingSystemVersion.split(' ');

    if (Platform.isAndroid) {
      if (versionProperties.length > 1) {
        return '$os ${Platform.operatingSystemVersion.split(' ')[1]}';
      }
      return os;
    }
    if (Platform.isIOS) {
      if (versionProperties.length > 1) {
        return '$os ${Platform.operatingSystemVersion.split(' ')[1]}';
      }
      return os;
    }

    return os;
  }
}
