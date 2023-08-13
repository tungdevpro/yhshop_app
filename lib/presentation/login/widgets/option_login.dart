import 'package:app_bloc/core/constants/app_constants.dart';
import 'package:app_bloc/core/constants/color_resource.dart';
import 'package:app_bloc/presentation/widgets/social/button_social_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/icon_resource.dart';

class OptionLogin extends StatelessWidget {
  const OptionLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Expanded(
                child: Divider(
              color: ColorResource.primary50,
              height: 1,
            )),
            SizedBox(width: 12),
            Text('Or sign in with',
                textAlign: TextAlign.center, style: TextStyle(color: ColorResource.primary, fontSize: 14, fontWeight: FontWeight.w400)),
            SizedBox(width: 12),
            Expanded(
                child: Divider(
              color: ColorResource.primary50,
              height: 1,
            )),
          ],
        ),
        const SizedBox(height: Globals.spaceMd),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: ButtonSocialLogin(
              icon: IconRes.icFlatGoogle,
              title: 'Google',
              onPressed: () {},
            )),
            const SizedBox(width: Globals.spaceMd),
            Expanded(child: ButtonSocialLogin(icon: IconRes.icFlatApple, title: 'Apple', onPressed: () {})),
          ],
        )
      ],
    );
  }
}
