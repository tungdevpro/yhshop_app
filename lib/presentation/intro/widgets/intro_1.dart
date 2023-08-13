import 'package:app_bloc/core/constants/color_resource.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/img_resource.dart';

class Intro1 extends StatelessWidget {
  final String? title;
  final String? image;
  const Intro1({super.key, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Image.asset(image ?? ImgRes.imgIntro1, fit: BoxFit.cover,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Globals.padding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title ?? "One best app for all your needs",
                  style: const TextStyle(color: Color(0xFF0F172A), fontSize: 28, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
              const SizedBox(height: 8),
              const Text('Easy shopping for all your needs just in hand, trusted by millions of people in the world.', textAlign: TextAlign.center, style: TextStyle(
                  color: ColorResource.grey400
              ),)
            ],
          ),
        ),

      ],
    );
  }
}
