import 'package:app_bloc/core/constants/color_resource.dart';
import 'package:app_bloc/core/constants/icon_resource.dart';
import 'package:app_bloc/core/constants/img_resource.dart';
import 'package:app_bloc/core/utils/navigation/app_navigator.dart';
import 'package:app_bloc/core/utils/navigation/route_path.dart';
import 'package:app_bloc/di/di.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../widgets/social/button_social_login.dart';

class GettingStartedPage extends StatelessWidget {
  const GettingStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(ImgRes.imgGettingStarted),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Globals.padding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(AppConstants.title,
                        textAlign: TextAlign.center, style: TextStyle(color: ColorResource.primary, fontSize: Globals.fsXxl, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    const Text('One best app for all your needs.',
                        textAlign: TextAlign.center, style: TextStyle(color: ColorResource.grey400, fontWeight: FontWeight.w400)),
                    const SizedBox(height: 30),
                    ButtonSocialLogin(icon: IconRes.icMailBox, title: 'Continue with Email', onPressed: _onGotoLogin,),
                    const SizedBox(height: Globals.padding),
                    const ButtonSocialLogin(icon: IconRes.icFlatGoogle, title: 'Continue with Google'),
                    const SizedBox(height: Globals.padding),
                    const ButtonSocialLogin(icon: IconRes.icFlatApple, title: 'Continue with Apple'),
                    const SizedBox(height: 50),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: 'Already have an account? ', style: TextStyle(color: ColorResource.primary, fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: 'Login',
                              style: const TextStyle(color: ColorResource.secondary, fontWeight: FontWeight.w700),
                              recognizer: TapGestureRecognizer()..onTap = _onGotoLogin),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onGotoLogin() => getIt<AppNavigator>().pushNamed(RoutePath.login);
}
