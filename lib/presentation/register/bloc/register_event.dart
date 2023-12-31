import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterFullNameChanged extends RegisterEvent {
  final String fullName;

  RegisterFullNameChanged(this.fullName);

  @override
  List<Object?> get props => [fullName];
}
class RegisterEmailChanged extends RegisterEvent {
  final String email;
  RegisterEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;
  RegisterPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class TogglePasswordEvent extends RegisterEvent {
  @override
  List<Object?> get props => [];
}