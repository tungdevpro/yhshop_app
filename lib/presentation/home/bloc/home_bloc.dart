import 'dart:async';

import 'package:app_bloc/di/di.dart';
import 'package:app_bloc/presentation/home/bloc/home_event.dart';
import 'package:app_bloc/presentation/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeFeedActive(index: 0)) {
    on<HomeSectionChangedEvent>(_onSectionChange);
  }

  static HomeBloc get to => getIt<HomeBloc>();
  int section = 0;

  FutureOr<void> _onSectionChange(HomeSectionChangedEvent event, Emitter<HomeState> emit) {
    int index = event.index;
    emit(HomeFeedActive(index: index));
  }
}
