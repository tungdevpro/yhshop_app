import 'package:app_bloc/core/constants/color_resource.dart';
import 'package:app_bloc/core/constants/icon_resource.dart';
import 'package:app_bloc/presentation/widgets/button_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_constants.dart';

class ButtonSocialLogin extends StatelessWidget {
  final String? icon;
  final String? title;
  final VoidCallback? onPressed;
  const ButtonSocialLogin({super.key, this.icon, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonBase(
      backgroundColor: Colors.white,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Globals.circle), side: const BorderSide(width: .5, color: ColorResource.grey200)),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            if(icon != null && icon != '') ...[
              SvgPicture.asset(icon!),
              const SizedBox(width: Globals.paddingSm)
            ],
          if(title != null && title != '') Text(title!, style: const TextStyle(color: ColorResource.primary, fontWeight: FontWeight.w700))
        ],
      ),
    );
  }
}
