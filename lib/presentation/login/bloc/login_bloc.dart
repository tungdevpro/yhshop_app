import 'package:app_bloc/core/common/validators/email_validate.dart';
import 'package:app_bloc/core/common/validators/password_validate.dart';
import 'package:app_bloc/core/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../di/di.dart';
import 'login_event.dart';
import 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> with LogMixin {
  LoginBloc() : super(const LoginState(status: LoginStatus.none)) {
    on<LoginEmailChanged>(_onEmailChange);
    on<LoginPasswordChanged>(_onPasswordChange);
    on<TogglePasswordEvent>(_onTogglePassword);
  }

  static LoginBloc get to => getIt<LoginBloc>();

  void _onEmailChange(LoginEmailChanged changed, Emitter<LoginState> emit) {
    final emailModel = EmailValidateModel.dirty(changed.email);
    emit(state.copyWith(status: LoginStatus.validating, email: emailModel));
  }

  void _onPasswordChange(LoginPasswordChanged changed, Emitter<LoginState> emit) {
    final passwordModel = PasswordValidateModel.dirty(changed.password);
    emit(state.copyWith(status: LoginStatus.validating, password: passwordModel));
  }

  void _onTogglePassword(TogglePasswordEvent changed, Emitter<LoginState> emit) {
    emit(state.copyWith(status: LoginStatus.validating, showPassword: !state.showPassword));
  }
}
