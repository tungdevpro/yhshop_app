import 'package:app_bloc/presentation/widgets/label_line.dart';
import 'package:flutter/material.dart';

class HomeCategoryComp extends StatelessWidget {
  const HomeCategoryComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelLine(title: 'Category'),
      ],
    );
  }
}
