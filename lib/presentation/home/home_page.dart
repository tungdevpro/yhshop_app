import 'package:app_bloc/core/constants/app_constants.dart';
import 'package:app_bloc/core/constants/color_resource.dart';
import 'package:app_bloc/core/constants/icon_resource.dart';
import 'package:app_bloc/presentation/home/bloc/home_bloc.dart';
import 'package:app_bloc/presentation/home/bloc/home_state.dart';
import 'package:app_bloc/presentation/home/comp/custom_bottom_navigation_bar.dart';
import 'package:app_bloc/presentation/widgets/layout/app_header.dart';
import 'package:app_bloc/presentation/widgets/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/navigation/route_path.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        body: Column(children: []),
        bottomNavigationBar: const CustomBottomNavigationBar(),
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
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: ColorResource.alertErrorBase),
                  child: Text('5', style: TextStyle(fontSize: 10)),
                ),
              ))
        ],
      ),
    );
  }
}
