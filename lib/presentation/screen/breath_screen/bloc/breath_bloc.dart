import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'breath_event.dart';
part 'breath_state.dart';

class BreathBloc extends Bloc<BreathEvent, BreathState> {
  BreathBloc() : super(const BreathState()) {
    on<BreathInitiated>((event, emit) {
      _onBreathInitiated(event, emit);
    });
  }
  FutureOr<void> _onBreathInitiated(
    BreathInitiated event,
    Emitter<BreathState> emit,
  )async {
     for(int i =0;i<=event.step;i++){
      await loopTime(event.beatBreath,emit);
    }
  }

  FutureOr<void> loopTime(List<int> listBreath, Emitter<BreathState> emit) async{
    emit(state.copyWith(showType : 1));
    await Future.delayed( Duration(seconds: listBreath.first));
    emit(state.copyWith(showType: 2));
    await Future.delayed( Duration(seconds: listBreath.last));

  }
}
