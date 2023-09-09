import 'package:app_bloc/core/utils/navigation/app_navigator.dart';
import 'package:app_bloc/di/di.dart';
import 'package:app_bloc/presentation/auth/widgets/auth_layout.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/color_resource.dart';
import '../../core/constants/icon_resource.dart';
import '../login/widgets/option_login.dart';
import '../widgets/button_base.dart';
import 'bloc/enter_otp_bloc.dart';

class EnterOTPPage extends StatelessWidget {
  EnterOTPPage({super.key});

  final EnterOTPBloc bloc = EnterOTPBloc.to;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EnterOTPBloc>(
      create: (context) => bloc,
      child: AuthLayout(
        hasLogo: false,
        padding: const EdgeInsets.symmetric(horizontal: Globals.paddingMd)
            .copyWith(bottom: 20),
        welcome: const [
          'Activate Account!',
          'Enter the verification code sent to *******dyne@mail.com'
        ],
        customLogo: GestureDetector(
            onTap: _onPop,
            child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 48),
                child: SvgPicture.asset(IconRes.icX))),
        builder: (BuildContext context) {
          return Column(
            children: [
              const SizedBox(height: Globals.spaceMd),
              _buildPinCodeField(context),
              const SizedBox(height: Globals.spaceMd),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Send a new code',
                    style: TextStyle(
                        fontSize: Globals.fsLg,
                        fontWeight: FontWeight.w700,
                        color: ColorResource.secondary),
                  )),
              const SizedBox(height: Globals.spaceMd * 3),
              ButtonBase(title: 'Confirm', onPressed: _onConfirm),
              const SizedBox(height: Globals.spaceMd),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPinCodeField(BuildContext context) {
    return PinCodeTextField(
      appContext: context,

      pastedTextStyle:
          TextStyle(color: Colors.green.shade600, fontWeight: FontWeight.bold),
      length: 5,
      obscureText: false,
      obscuringCharacter: '*',
      // obscuringWidget: const FlutterLogo(
      //   size: 24,
      // ),
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      validator: (v) {
        // if (v!.length < 3) {
        //   return "I'm from validator";
        // } else {
        //   return null;
        // }
      },

      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle,
        // borderRadius: BorderRadius.circular(Globals.circle),
        fieldHeight: 56,
        fieldWidth: 56,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        activeColor: ColorResource.grey200,
        inactiveColor: ColorResource.grey200,
        borderWidth: 1,
        activeBorderWidth: 1,
        inactiveBorderWidth: 1,
        selectedBorderWidth: 1,
        errorBorderWidth: 1,
        selectedFillColor: Colors.white,
        selectedColor: ColorResource.grey900,
        // fieldOuterPadding: EdgeInsets.all(10),
      ),
      cursorColor: Colors.transparent,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,

      // errorAnimationController: errorController,
      // controller: textEditingController,
      keyboardType: TextInputType.number,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.black12,
          blurRadius: 10,
        )
      ],
      onCompleted: (v) {
        debugPrint("Completed");
      },
      // onTap: () {
      //   print("Pressed");
      // },
      onChanged: (value) {
        debugPrint(value);
      },
      beforeTextPaste: (text) {
        debugPrint("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }

  void _onPop() {
    getIt<AppNavigator>().pop();
  }

  void _onConfirm() {}
}
