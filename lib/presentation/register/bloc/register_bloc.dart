import 'package:app_bloc/core/common/validators/fullname_validate.dart';
import 'package:app_bloc/core/utils/logger.dart';
import 'package:app_bloc/presentation/register/bloc/register_event.dart';
import 'package:app_bloc/presentation/register/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/common/validators/email_validate.dart';
import '../../../core/common/validators/password_validate.dart';
import '../../../di/di.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> with LogMixin {
  RegisterBloc() : super(const RegisterState(status: RegisterStatus.none)) {
    on<RegisterFullNameChanged>(_onFullNameChange);
    on<RegisterEmailChanged>(_onEmailChange);
    on<RegisterPasswordChanged>(_onPasswordChange);
    on<TogglePasswordEvent>(_onTogglePassword);
  }

  static RegisterBloc get to => getIt<RegisterBloc>();

  void _onFullNameChange(RegisterFullNameChanged changed, Emitter<RegisterState> emit) {
    final fullNameModel = FullNameValidateModel.dirty(changed.fullName);
    emit(state.copyWith(status: RegisterStatus.validating, fullName: fullNameModel));
  }

  void _onEmailChange(RegisterEmailChanged changed, Emitter<RegisterState> emit) {
    final emailModel = EmailValidateModel.dirty(changed.email);
    emit(state.copyWith(status: RegisterStatus.validating, email: emailModel));
  }

  void _onPasswordChange(RegisterPasswordChanged changed, Emitter<RegisterState> emit) {
    final passwordModel = PasswordValidateModel.dirty(changed.password);
    emit(state.copyWith(status: RegisterStatus.validating, password: passwordModel));
  }

  void _onTogglePassword(TogglePasswordEvent changed, Emitter<RegisterState> emit) {
    emit(state.copyWith(status: RegisterStatus.validating, showPassword: !state.showPassword));
  }
}