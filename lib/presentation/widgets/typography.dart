import 'package:app_bloc/core/constants/app_constants.dart';
import 'package:app_bloc/core/constants/color_resource.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppTypography {
  const AppTypography._();

  static const h1 =
      TextStyle(fontSize: Globals.fsXl, color: ColorResource.primary);
}
