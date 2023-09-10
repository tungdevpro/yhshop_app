import 'package:app_bloc/core/base/app/app_bloc.dart';
import 'package:app_bloc/core/base/app/app_event.dart';
import 'package:app_bloc/core/base/app/app_state.dart';
import 'package:app_bloc/core/base/base_event.dart';
import 'package:app_bloc/core/base/base_state.dart';
import 'package:app_bloc/core/constants/app_constants.dart';
import 'package:app_bloc/core/utils/navigation/app_navigator.dart';
import 'package:app_bloc/core/utils/theme/theme_manager.dart';
import 'package:app_bloc/di/di.dart';
import 'package:app_bloc/presentation/auth/bloc/auth_bloc.dart';
import 'package:app_bloc/presentation/auth/bloc/auth_event.dart';
import 'package:app_bloc/presentation/auth/bloc/auth_state.dart';
import 'package:app_bloc/presentation/initial/initial_page.dart';
import 'package:app_bloc/presentation/internet_status/internet_status_page.dart';
import 'package:app_bloc/presentation/intro/intro_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/navigation/page_manager.dart';
import 'core/utils/navigation/route_path.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => getIt<AppBloc>()..add(AppInitialEvent())),
        BlocProvider(
            create: (context) =>
                getIt<AuthBloc>()..add(const AuthInitialEvent())),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          final bloc = getIt<AppBloc>();
          return MaterialApp(
            title: AppConstants.title,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: generateRoutes,
            initialRoute: RoutePath.initial,
            themeMode: bloc.themeMode,
            theme: ThemeManager.light,
            home: StreamBuilder<ConnectivityResult>(
              stream: bloc.connectivityStream,
              builder: (context, snapshot) {
                final isConnected = [
                  ConnectivityResult.wifi,
                  ConnectivityResult.ethernet,
                  ConnectivityResult.mobile
                ].contains(snapshot.data);
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    ApplicationContent(bloc: bloc),
                    if (!isConnected &&
                        snapshot.connectionState != ConnectionState.waiting)
                      const InternetStatusPage()
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ApplicationContent extends StatefulWidget {
  final AppBloc bloc;

  const ApplicationContent({super.key, required this.bloc});

  @override
  State<ApplicationContent> createState() => ApplicationContentState();
}

class ApplicationContentState extends State<ApplicationContent> {
  @override
  void initState() {
    super.initState();
    getIt<AppNavigator>().setContext(context);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.bloc.isIntro) return const IntroPage();
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthNotLoggedIn) {
              getIt<AppNavigator>().pushNamedAndRemoveUntil(RoutePath.login);
              return;
            }
            if (state is AuthUserChanged) {
              getIt<AppNavigator>().pushNamedAndRemoveUntil(RoutePath.home);
              return;
            }
          },
        ),
      ],
      child: const InitialPage(),
    );
  }
}
