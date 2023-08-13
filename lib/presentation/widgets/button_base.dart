import 'package:app_bloc/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../core/constants/color_resource.dart';

class ButtonBase extends StatelessWidget {
  final VoidCallback? onPressed;
  final dynamic title;
  final Color? backgroundColor;
  final OutlinedBorder? shape;

  const ButtonBase({super.key, this.title, this.onPressed, this.backgroundColor, this.shape});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor ?? ColorResource.primary),
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(Globals.padding)),
        shape: MaterialStateProperty.all<OutlinedBorder>(shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(Globals.circle))),
        elevation: MaterialStateProperty.all<double>(.0),
        minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(50))
      ),
      child: title is Widget ? title : Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white)),
    );
  }
}
