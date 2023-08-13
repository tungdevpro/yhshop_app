import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum MessageType { error, success }

extension ContextExtension on BuildContext {
  void hideKeyboard() {
    FocusScope.of(this).requestFocus(FocusNode());
  }

  bool get isTablet {
    var shortestSide = MediaQuery.of(this).size.shortestSide;
    return shortestSide >= 600;
  }

  double get paddingTop => MediaQuery.of(this).padding.top;

  Future<void> copyText(
      String text, {
        bool showToast = true,
        VoidCallback? callback,
      }) {
    var data = ClipboardData(text: text);
    return Clipboard.setData(data).then((_) {
      callback?.call();
    }).catchError((_) {});
  }
}

extension NavigatorStateExtension on NavigatorState {
  void pushNamedIfNotCurrent(String routeName, {Object? arguments}) {
    if (!isCurrent(routeName)) {
      pushNamed(routeName, arguments: arguments);
    }
  }

  bool isCurrent(String routeName) {
    bool isCurrent = false;
    popUntil((route) {
      if (route.settings.name == routeName) {
        isCurrent = true;
      }
      return true;
    });
    return isCurrent;
  }
}


extension ModalRouteExtension on BuildContext {
  ModalRoute? get modalRoute => ModalRoute.of(this);

  RouteSettings? get routeSettings => modalRoute?.settings;

  String? get routeName => routeSettings?.name;

  T args<T>() => modalRoute?.settings.arguments as T;
}

extension ThemeCtxExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TargetPlatform get platform => theme.platform;

  bool get isAndroid => platform == TargetPlatform.android;

  bool get isIOS => platform == TargetPlatform.iOS;

  bool get isMacOS => platform == TargetPlatform.macOS;

  bool get isWindows => platform == TargetPlatform.windows;

  bool get isFuchsia => platform == TargetPlatform.fuchsia;
}
