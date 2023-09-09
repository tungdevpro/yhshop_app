import 'package:flutter/material.dart';

@immutable
abstract class RoutePath {
  static const String initial = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String gettingStarted = '/getting-started';
  static const String enterOTP = '/enter-otp';
}

class TopRoute {
  final String path;
  const TopRoute(this.path);
}
