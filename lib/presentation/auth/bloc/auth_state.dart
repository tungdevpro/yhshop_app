import 'package:app_bloc/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {

  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthUserChanged extends AuthState {
  final UserModel? user;

  AuthUserChanged({this.user});

  @override
  List<Object?> get props => [user];
}

class AuthNotLoggedIn extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLogoutRequest extends AuthState {
  @override
  List<Object?> get props => [];
}