import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class ThemeManager {
  ThemeManager._();

  static ThemeData get light => ThemeData(
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.white,
            elevation: .0),
        fontFamily: 'PlusJakartaSans',
        scaffoldBackgroundColor: Colors.white,
      );
}
