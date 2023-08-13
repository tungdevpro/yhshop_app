import 'package:app_bloc/core/base/app/app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/utils/navigation/app_navigator.dart';
import '../../../core/utils/navigation/route_path.dart';
import '../../../di/di.dart';

@injectable
class IntroCubit extends Cubit<int> {
  IntroCubit() : super(0);

  int totalPage = 3;

  void next() {
    emit(state + 1);
  }

  void previous() {
    emit(state - 1);
  }

  void gotoGetting() {
    final AppBloc appBloc = getIt<AppBloc>();
    appBloc.skipIntro();
    getIt<AppNavigator>().pushNamed(RoutePath.gettingStarted);
  }
}