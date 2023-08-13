import 'package:app_bloc/core/common/validators/email_validate.dart';
import 'package:app_bloc/core/common/validators/fullname_validate.dart';
import 'package:app_bloc/core/common/validators/password_validate.dart';
import 'package:equatable/equatable.dart';

enum RegisterStatus { none, success, failure, validating }

class RegisterState extends Equatable {
  final RegisterStatus status;
  final FullNameValidateModel fullName;
  final EmailValidateModel email;
  final PasswordValidateModel password;
  final bool showPassword;

  const RegisterState(
      {this.status = RegisterStatus.none,
        this.fullName = const FullNameValidateModel.pure(),
        this.email = const EmailValidateModel.pure(),
        this.password = const PasswordValidateModel.pure(),
        this.showPassword = false});

  RegisterState copyWith({RegisterStatus? status, FullNameValidateModel? fullName, EmailValidateModel? email, PasswordValidateModel? password, bool? showPassword}) {
    return RegisterState(
      status: status ?? this.status,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  @override
  List<Object?> get props => [status, fullName, email, password, showPassword];
}
