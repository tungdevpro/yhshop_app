import 'package:app_bloc/core/base/base_bloc.dart';
import 'package:app_bloc/core/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocWidget<T extends BaseBloc> extends StatelessWidget {
  const BlocWidget({super.key});

  T initBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: (context) => initBloc(),
      child: BlocConsumer<T, BaseState>(
        listener: (context, state) => {},
        builder: (context, state) {
          return const SizedBox();
        },
      ),
    );
  }


}
