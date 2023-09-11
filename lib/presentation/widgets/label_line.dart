import 'package:app_bloc/core/constants/app_constants.dart';
import 'package:app_bloc/core/constants/color_resource.dart';
import 'package:flutter/material.dart';

class LabelLine extends StatelessWidget {
  final dynamic title;
  final VoidCallback? onSeeAll;
  final bool hasSeeAll;
  const LabelLine({super.key, required this.title, this.onSeeAll, this.hasSeeAll = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title is Widget ? title : Text(title, style: const TextStyle(fontSize: Globals.fsLg, fontWeight: FontWeight.w700)),
        if (hasSeeAll) InkWell(onTap: onSeeAll, child: const Text('See all', style: TextStyle(color: ColorResource.grey400))),
      ],
    );
  }
}
