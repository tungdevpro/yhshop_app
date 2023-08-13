import 'package:app_bloc/core/base/base_event.dart';
import 'package:app_bloc/core/base/base_state.dart';
import 'package:app_bloc/core/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc extends Bloc<BaseEvent, BaseState> with LogMixin {
  BaseBloc(BaseState state) : super(state) {
    on<BaseEvent>((event, emit) async {
      if (event is InitialEvent) {
        await initial(emit);
      } else {
        await handleEvent(event, emit);
      }
    });
  }

  Future<void> initial(Emitter<BaseState> emitter) async {}

  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emitter);
}