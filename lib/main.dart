import 'package:app_bloc/core/base/app_bloc_observer.dart';
import 'package:app_bloc/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'application.dart';
import 'core/utils/storage_lib.dart';

void main() async {
  await setup();
  runApp(const Application());
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  configureDependencies();
  await Hive.initFlutter();
  await LocalStorage.initialize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));
}