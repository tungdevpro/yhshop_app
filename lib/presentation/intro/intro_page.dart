import 'package:app_bloc/core/constants/app_constants.dart';
import 'package:app_bloc/core/constants/color_resource.dart';
import 'package:app_bloc/core/constants/img_resource.dart';
import 'package:app_bloc/di/di.dart';
import 'package:app_bloc/presentation/intro/cubit/intro_cubit.dart';
import 'package:app_bloc/presentation/intro/widgets/bottom_intro.dart';
import 'package:app_bloc/presentation/intro/widgets/intro_1.dart';
import 'package:app_bloc/presentation/widgets/button_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController pageController = PageController();

  final IntroCubit cubit = getIt<IntroCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<IntroCubit>(
      create: (_) => cubit,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 3,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: _onPageChanged,
                    physics: const ClampingScrollPhysics(),
                    children: pages(),
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      BlocBuilder<IntroCubit, int>(
                        builder: (context, state) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List<Widget>.generate(
                              context.watch<IntroCubit>().totalPage,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: state == index ? 32 : 8,
                                height: 8,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: state == index
                                        ? ColorResource.primary
                                        : ColorResource.primary100,
                                    borderRadius:
                                        BorderRadius.circular(Globals.circle)),
                              ),
                            ).toList(),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24)
                            .copyWith(top: 20),
                        child: ButtonBase(
                            title: 'Get Started', onPressed: cubit.gotoGetting),
                      ),
                      const SizedBox(height: Globals.paddingMd),
                      const BottomIntro()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPageChanged(index) {
    index > cubit.state ? cubit.next() : cubit.previous();
  }

  List<Widget> pages() {
    return [
      const Intro1(),
      const Intro1(
          title: 'Get real-time updates for all deliveries',
          image: ImgRes.imgIntro2),
      const Intro1(
          title: 'Follow and get update from favorite store',
          image: ImgRes.imgIntro3),
    ];
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
