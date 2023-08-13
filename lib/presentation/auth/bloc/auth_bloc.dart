import 'package:app_bloc/presentation/auth/bloc/auth_event.dart';
import 'package:app_bloc/presentation/auth/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../di/di.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
   on<AuthInitialEvent>(_onInitial);
  }
  static AuthBloc get to => getIt<AuthBloc>();


  void _onInitial(AuthInitialEvent changed, Emitter<AuthState> emitter) {
    emitter.call(AuthNotLoggedIn());
  }

  Future<String> _getUserData() async {
    return '';
  }
}