import 'package:app_bloc/core/constants/app_constants.dart';
import 'package:app_bloc/core/constants/color_resource.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomIntro extends StatelessWidget {
  const BottomIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Text.rich(
        TextSpan(
          style: const TextStyle(color: ColorResource.primary),
          children: [
            const TextSpan(
                text: 'By taping “Get Started” and using the Shopline app, you’re agreeing to our ',
                style: TextStyle(fontSize: Globals.fsSm, fontWeight: FontWeight.w400)),
            TextSpan(
                text: 'terms of service',
                style: const TextStyle(color: ColorResource.secondary, fontSize: Globals.fsSm, fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()..onTap = () {}),
            const TextSpan(text: ' and ', style: TextStyle(fontSize: Globals.fsSm, fontWeight: FontWeight.w400)),
            TextSpan(
                text: 'privacy policy',
                style: const TextStyle(color: ColorResource.secondary, fontSize: Globals.fsSm, fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()..onTap = () {}),
            const TextSpan(text: '.', style: TextStyle(fontSize: Globals.fsSm, fontWeight: FontWeight.w400)),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
