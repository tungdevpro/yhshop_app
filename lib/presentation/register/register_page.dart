import 'dart:math';

import 'package:app_bloc/core/common/validators/fullname_validate.dart';
import 'package:app_bloc/core/utils/navigation/app_navigator.dart';
import 'package:app_bloc/core/utils/navigation/route_path.dart';
import 'package:app_bloc/di/di.dart';
import 'package:app_bloc/presentation/auth/widgets/auth_layout.dart';
import 'package:app_bloc/presentation/register/bloc/register_bloc.dart';
import 'package:app_bloc/presentation/register/bloc/register_event.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/color_resource.dart';
import '../../core/constants/icon_resource.dart';
import '../login/widgets/option_login.dart';
import '../widgets/button_base.dart';
import '../widgets/input_field.dart';
import 'bloc/register_state.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final RegisterBloc registerBloc = RegisterBloc.to;

  @override
  Widget build(BuildContext context) {
    getIt<AppNavigator>().setContext(context);
    return BlocProvider<RegisterBloc>(
      create: (context) => registerBloc,
      child: AuthLayout(
        hasLogo: false,
        padding: const EdgeInsets.symmetric(horizontal: Globals.paddingMd)
            .copyWith(bottom: 20),
        welcome: const [
          'Welcome!',
          'Let’s get started with a free Shopline account.'
        ],
        customLogo: GestureDetector(
            onTap: () => _onPop(context),
            child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 48),
                child: SvgPicture.asset(IconRes.icX))),
        bottomWidget: Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(
                      color: ColorResource.primary,
                      fontWeight: FontWeight.w400)),
              TextSpan(
                  text: 'Login',
                  style: const TextStyle(
                      color: ColorResource.secondary,
                      fontWeight: FontWeight.w700),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => _onGotoLogin()),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        builder: (BuildContext context) {
          return Column(
            children: [
              _buildRegisterForm(),
              const SizedBox(height: Globals.spaceMd),
              ButtonBase(title: 'Register', onPressed: _onRegister),
              const SizedBox(height: Globals.spaceXl),
              const OptionLogin(),
            ],
          );
        },
      ),
    );
  }

  Column _buildRegisterForm() {
    return Column(
      children: [
        BlocBuilder<RegisterBloc, RegisterState>(
          buildWhen: (previous, current) =>
              current.fullName != previous.fullName,
          builder: (context, state) {
            return InputField(
              hintText: 'Fullname',
              errorText: state.fullName.displayError?.toValue(),
              onChanged: (fullName) =>
                  registerBloc.add(RegisterFullNameChanged(fullName)),
              prefixIcon: SvgPicture.asset(IconRes.icFullnameLight),
            );
          },
        ),
        const SizedBox(height: Globals.space),
        BlocBuilder<RegisterBloc, RegisterState>(
          buildWhen: (previous, current) => current.email != previous.email,
          builder: (context, state) {
            return InputField(
              hintText: 'Email',
              errorText: state.email.displayError,
              onChanged: (email) =>
                  registerBloc.add(RegisterEmailChanged(email)),
              prefixIcon: SvgPicture.asset(IconRes.icEmailLight),
            );
          },
        ),
        const SizedBox(height: Globals.space),
        BlocBuilder<RegisterBloc, RegisterState>(
          buildWhen: (previous, current) =>
              current.password != previous.password,
          builder: (context, state) {
            return InputField(
              onChanged: (password) =>
                  registerBloc.add(RegisterPasswordChanged(password)),
              hintText: 'Password',
              errorText: state.email.displayError,
              prefixIcon: SvgPicture.asset(IconRes.icPasswordLight),
              suffixIcon: BlocBuilder<RegisterBloc, RegisterState>(
                // buildWhen: (previous, current) => current.showPassword != previous.showPassword,
                builder: (context, show) {
                  return GestureDetector(
                    onTap: () => registerBloc.add(TogglePasswordEvent()),
                    child: show.showPassword
                        ? SvgPicture.asset(IconRes.icPasswordLight)
                        : SvgPicture.asset(IconRes.icEyeOffLight),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }

  void _onGotoLogin() {
    getIt<AppNavigator>().pop();
  }

  void _onPop(BuildContext context) {
    getIt<AppNavigator>().pop();
  }

  void _onRegister() {
    getIt<AppNavigator>().pushNamed(RoutePath.enterOTP);
  }
}
