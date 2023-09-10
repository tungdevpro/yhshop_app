import 'package:app_bloc/core/constants/app_string.dart';
import 'package:app_bloc/core/constants/color_resource.dart';
import 'package:app_bloc/core/constants/icon_resource.dart';
import 'package:app_bloc/presentation/home/bloc/home_bloc.dart';
import 'package:app_bloc/presentation/home/bloc/home_event.dart';
import 'package:app_bloc/presentation/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        HomeFeedActive s = (state as HomeFeedActive);
        return _buildBottomNavigator(context, s.index);
      },
    );
  }

  BottomNavigationBar _buildBottomNavigator(BuildContext context, int index) {
    return BottomNavigationBar(
      onTap: (value) => context.read<HomeBloc>().add(HomeSectionChangedEvent(index: value)),
      currentIndex: index,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(icon: SvgPicture.asset(IconRes.icHome), label: AppStrings.home, activeIcon: SvgPicture.asset(IconRes.icHomeFill)),
        BottomNavigationBarItem(icon: SvgPicture.asset(IconRes.icSearch), label: AppStrings.search, activeIcon: SvgPicture.asset(IconRes.icSearchFill)),
        BottomNavigationBarItem(icon: SvgPicture.asset(IconRes.icHeart), label: AppStrings.wishList, activeIcon: SvgPicture.asset(IconRes.icHeartFill)),
        BottomNavigationBarItem(icon: SvgPicture.asset(IconRes.icBag), label: AppStrings.bag, activeIcon: SvgPicture.asset(IconRes.icBagFill)),
        BottomNavigationBarItem(icon: SvgPicture.asset(IconRes.icProfile), label: AppStrings.profile, activeIcon: SvgPicture.asset(IconRes.icProfileFill)),
      ],
      unselectedFontSize: 10,
      selectedFontSize: 10,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 10, color: ColorResource.primary),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10, color: ColorResource.grey400),
      unselectedItemColor: ColorResource.grey400,
      selectedItemColor: ColorResource.primary,
    );
  }
}
