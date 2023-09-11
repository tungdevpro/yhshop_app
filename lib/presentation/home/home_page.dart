import 'package:app_bloc/core/constants/app_constants.dart';
import 'package:app_bloc/core/constants/color_resource.dart';
import 'package:app_bloc/core/constants/icon_resource.dart';
import 'package:app_bloc/presentation/account/account_page.dart';
import 'package:app_bloc/presentation/bag/bag_page.dart';
import 'package:app_bloc/presentation/home/bloc/home_bloc.dart';
import 'package:app_bloc/presentation/home/comp/custom_bottom_navigation_bar.dart';
import 'package:app_bloc/presentation/search/seach_page.dart';
import 'package:app_bloc/presentation/widgets/layout/app_header.dart';
import 'package:app_bloc/presentation/widgets/typography.dart';
import 'package:app_bloc/presentation/wishlist/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'comp/home_content_comp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = HomeBloc.to;
    return BlocProvider<HomeBloc>(
      create: (_) => bloc,
      child: Scaffold(
        appBar: AppHeader(
          leadingIcon: LeadingIcon.none,
          text: 'Shopline',
          titleTextStyle: AppTypography.h1.copyWith(fontWeight: FontWeight.bold),
          actions: [_buildingIcon(IconRes.icSms), _buildingIcon(IconRes.icNotification)],
        ),
        body: PageView(
          controller: pageController,
          children: const [
            HomeContentComp(),
            SearchPage(),
            WishListPage(),
            BagPage(),
            AccountPage(),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(onTap: _onPageChanged),
      ),
    );
  }

  Widget _buildingIcon(String icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(margin: const EdgeInsets.only(right: Globals.paddingMd), child: SvgPicture.asset(icon, width: 24, height: 24)),
          Positioned(
              right: 15,
              top: 8,
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorResource.alertErrorBase),
                  child: const Text('5', style: TextStyle(fontSize: 10)),
                ),
              ))
        ],
      ),
    );
  }

  void _onPageChanged(int index) {
    pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
