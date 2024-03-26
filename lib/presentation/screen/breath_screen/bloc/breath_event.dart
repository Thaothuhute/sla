part of 'breath_bloc.dart';

@immutable
abstract class BreathEvent {}

class BreathInitiated extends BreathEvent{
  BreathInitiated(this.showType, this.time, this.beatBreath,this.step);
  final int showType;
  final List<int> beatBreath ;
  final int time;
  final int step;
}
