import 'package:flutter/cupertino.dart';
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

extension NavigatorExtension on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  Future<T?> push<T extends Object?>(Route<T> route) => navigator.push(route);

  Future<T?> toPage<T extends Object?>(Widget child) =>
      navigator.push(CupertinoPageRoute(builder: (_) => child));

  Future<T?> popToPage<T extends Object?>(Widget child) {
    navigator.pop();
    return navigator.push(CupertinoPageRoute(builder: (_) => child));
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
          Route<T> route,
          {TO? result}) =>
      navigator.pushReplacement(route, result: result);

  Future<T?> pushNamed<T extends Object?>(String routeName,
      {Object? arguments}) {
    return navigator.pushNamed(routeName, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
      String routeName,
      {TO? result,
      Object? arguments}) {
    return navigator.pushReplacementNamed(routeName,
        result: result, arguments: arguments);
  }

  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
      String routeName,
      {TO? result,
      Object? arguments}) {
    return navigator.popAndPushNamed(routeName,
        result: result, arguments: arguments);
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
      String newRouteName, RoutePredicate predicate,
      {Object? arguments}) {
    return navigator.pushNamedAndRemoveUntil(newRouteName, predicate,
        arguments: arguments);
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>(
      Route<T> newRoute, RoutePredicate predicate) {
    return navigator.pushAndRemoveUntil(newRoute, predicate);
  }

  void replace<T extends Object?>(
          {required Route<dynamic> oldRoute, required Route<T> newRoute}) =>
      navigator.replace(oldRoute: oldRoute, newRoute: newRoute);

  void replaceRouteBelow<T extends Object?>(
          {required Route<dynamic> anchorRoute, required Route<T> newRoute}) =>
      navigator.replaceRouteBelow(anchorRoute: anchorRoute, newRoute: newRoute);

  bool canPop() => navigator.canPop();

  Future<bool> maybePop<T extends Object?>([T? result]) =>
      navigator.maybePop(result);

  void pop<T extends Object?>([T? result]) {
    return navigator.pop(result);
  }
}
