import 'package:app_bloc/core/constants/app_constants.dart';
import 'package:app_bloc/presentation/home/comp/home_flash_sale_comp.dart';
import 'package:flutter/material.dart';

import 'home_category_comp.dart';

class HomeContentComp extends StatelessWidget {
  const HomeContentComp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(Globals.padding),
      children: [
        HomeCategoryComp(),
        HomeFlashSaleComp(),
      ],
    );
  }
}
