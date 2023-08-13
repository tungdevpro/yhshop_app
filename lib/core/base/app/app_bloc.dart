import 'package:app_bloc/core/base/app/app_event.dart';
import 'package:app_bloc/core/base/app/app_state.dart';
import 'package:app_bloc/core/utils/storage_lib.dart';
import 'package:app_bloc/di/di.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitialState()) {
    on<AppInitialEvent>(_onInitial);
    on<AppThemeChangeEvent>(_onThemeChange);
  }

  static AppBloc get to => getIt<AppBloc>();
  bool isIntro = true;

  bool isDarkMode = false;
  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;
  Stream<ConnectivityResult> get connectivityStream => Connectivity().onConnectivityChanged;

  Future<void> _onThemeChange(AppThemeChangeEvent changeEvent, Emitter<AppState> emit) async {}

  void _onInitial(AppInitialEvent changed, Emitter<AppState> emit) {
    isIntro = getIntro();
  }

  bool getIntro() => (LocalStorage.get(StoreKey.intro) == null || LocalStorage.get(StoreKey.intro) == 0) ? true : false;

  Future<void> skipIntro() async => await LocalStorage.put(StoreKey.intro, 1);
}