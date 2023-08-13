import 'package:app_bloc/core/common/extensions/context_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/color_resource.dart';
import '../../../core/constants/icon_resource.dart';

class AuthLayout extends StatelessWidget {
  final Widget? bottomWidget;
  final bool hasLogo;
  final List<String> welcome;
  final WidgetBuilder builder;
  final Widget? customLogo;
  final EdgeInsets? padding;

  const AuthLayout({super.key, this.bottomWidget, this.hasLogo = true, required this.welcome, required this.builder, this.customLogo, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.hideKeyboard,
      child: Scaffold(
        bottomNavigationBar: bottomWidget != null ? Container(alignment: Alignment.topCenter, height: 35, child: bottomWidget) : null,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: padding ?? const EdgeInsets.symmetric(vertical: 20, horizontal: Globals.paddingMd),
            // physics: const BouncingScrollPhysics(),
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                if(hasLogo) ...[
                  _buildLogo(),
                  const SizedBox(height: Globals.spaceXl),
                ] else ...[
                  if(customLogo != null) customLogo!
                ],
                _buildWelcome(),
                const SizedBox(height: Globals.spaceMd),
                Builder(builder: builder),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() => Align(alignment: Alignment.centerLeft, child: SvgPicture.asset(IconRes.icLogo));

  Column _buildWelcome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(welcome.first, style: const TextStyle(color: ColorResource.primary, fontSize: Globals.fsXxl, fontWeight: FontWeight.w700)),
        const SizedBox(height: Globals.spaceSm),
        Text(welcome.last, style: const TextStyle(color: ColorResource.grey400, fontWeight: FontWeight.w400))
      ],
    );
  }
}
