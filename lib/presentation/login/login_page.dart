import 'dart:math';

import 'package:app_bloc/core/common/extensions/context_extension.dart';
import 'package:app_bloc/core/constants/app_constants.dart';
import 'package:app_bloc/core/constants/color_resource.dart';
import 'package:app_bloc/core/constants/icon_resource.dart';
import 'package:app_bloc/presentation/auth/widgets/auth_layout.dart';
import 'package:app_bloc/presentation/login/bloc/login_bloc.dart';
import 'package:app_bloc/presentation/login/bloc/login_state.dart';
import 'package:app_bloc/presentation/login/widgets/option_login.dart';
import 'package:app_bloc/presentation/register/register_page.dart';
import 'package:app_bloc/presentation/widgets/button_base.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/animated_dialog.dart';
import '../widgets/input_field.dart';
import 'bloc/login_event.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final loginBloc = LoginBloc.to;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginBloc,
      child: AuthLayout(
        welcome: const ['Welcome back!', 'Please enter your details.'],
        bottomWidget: Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'Already have an account? ', style: TextStyle(color: ColorResource.primary, fontWeight: FontWeight.w400)),
              TextSpan(
                  text: 'Register',
                  style: const TextStyle(color: ColorResource.secondary, fontWeight: FontWeight.w700),
                  recognizer: TapGestureRecognizer()..onTap = () => _onGotoRegister(context)),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        builder: (BuildContext context) {
          return Column(
            children: [
              _buildLoginForm(),
              const SizedBox(height: Globals.space),
              _buildForgotPassword(),
              const SizedBox(height: Globals.spaceMd),
              const ButtonBase(title: 'Login'),
              const SizedBox(height: Globals.spaceXl),
              const OptionLogin(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildForgotPassword() {
    return GestureDetector(
      onTap: _onGotoForgotPassword,
      child: const Align(
        alignment: Alignment.centerRight,
        child: Text('Forgot Password?',
            textAlign: TextAlign.right, style: TextStyle(color: ColorResource.secondary, fontSize: 14, fontWeight: FontWeight.w700)),
      ),
    );
  }

  Column _buildLoginForm() {
    return Column(
      children: [
        BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (previous, current) => current.email != previous.email,
          builder: (context, state) {
            return InputField(
              hintText: 'Email',
              errorText: state.email.displayError,
              onChanged: (email) => loginBloc.add(LoginEmailChanged(email)),
              prefixIcon: SvgPicture.asset(IconRes.icEmailLight),
            );
          },
        ),
        const SizedBox(height: Globals.space),
        BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (previous, current) => current.password != previous.password,
          builder: (context, state) {
            return InputField(
              onChanged: (password) => loginBloc.add(LoginPasswordChanged(password)),
              hintText: 'Password',
              errorText: state.email.displayError,
              prefixIcon: SvgPicture.asset(IconRes.icPasswordLight),
              suffixIcon: BlocBuilder<LoginBloc, LoginState>(
                // buildWhen: (previous, current) => current.showPassword != previous.showPassword,
                builder: (context, show) {
                  return GestureDetector(
                    onTap: () => loginBloc.add(TogglePasswordEvent()),
                    child: show.showPassword ? SvgPicture.asset(IconRes.icPasswordLight) : SvgPicture.asset(IconRes.icEyeOffLight),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }

  void _onGotoForgotPassword() {}

  void _onGotoRegister(BuildContext context) {
    showAnimatedDialog(
      context,
      animationType: DialogTransitionMode.slideFromBottom,
      duration: const Duration(milliseconds: 200),
      builder: (BuildContext context) {
        return RegisterPage();
      },
    );
  }
}
