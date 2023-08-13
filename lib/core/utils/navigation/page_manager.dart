import 'package:app_bloc/core/utils/navigation/route_path.dart';
import 'package:app_bloc/presentation/getting_started/getting_started_page.dart';
import 'package:app_bloc/presentation/register/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../presentation/login/login_page.dart';
import '../../../presentation/initial/initial_page.dart';

Map<String, WidgetBuilder> routes = {
  RoutePath.initial: (_) => const InitialPage(),
  RoutePath.gettingStarted: (_) => const GettingStartedPage(),
  RoutePath.login: (_) => LoginPage(),
  RoutePath.register: (_) => RegisterPage(),
};

Route<dynamic> generateRoutes(RouteSettings settings) {
  String? routeName = settings.name?.split('?').first;

  return CupertinoPageRoute(
      builder: routes[routeName] ?? (_) => const Scaffold(body: Text("empty route"),), settings: settings);
}
