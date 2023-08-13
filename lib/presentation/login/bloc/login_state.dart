import 'package:app_bloc/core/common/validators/email_validate.dart';
import 'package:app_bloc/core/common/validators/password_validate.dart';
import 'package:equatable/equatable.dart';

enum LoginStatus { none, success, failure, validating }

class LoginState extends Equatable {
  final LoginStatus status;
  final EmailValidateModel email;
  final PasswordValidateModel password;
  final bool showPassword;

  const LoginState(
      {this.status = LoginStatus.none,
      this.email = const EmailValidateModel.pure(),
      this.password = const PasswordValidateModel.pure(),
      this.showPassword = false});

  LoginState copyWith({LoginStatus? status, EmailValidateModel? email, PasswordValidateModel? password, bool? showPassword}) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  @override
  List<Object?> get props => [status, email, password, showPassword];
}
