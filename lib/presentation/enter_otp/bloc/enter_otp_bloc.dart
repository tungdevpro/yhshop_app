import 'package:app_bloc/di/di.dart';
import 'package:app_bloc/presentation/enter_otp/bloc/enter_otp_event.dart';
import 'package:app_bloc/presentation/enter_otp/bloc/enter_otp_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class EnterOTPBloc extends Bloc<EnterOTPEvent, EnterOTPState> {
  EnterOTPBloc() : super(EnterOTPInitalState()) {}

  static EnterOTPBloc get to => getIt<EnterOTPBloc>();
}
