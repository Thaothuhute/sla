part of 'breath_bloc.dart';


class BreathState  extends Equatable {
  final int  showType;
  final int time;
  final List<int> beatBreath;


  const BreathState({this.showType = 1, this.time = 1, this.beatBreath = const [1,1]});

  factory BreathState.initialState() =>const  BreathState();

  @override
  // TODO: implement props
  List<Object?> get props =>[];

  BreathState copyWith({int? showType,int? time,List<int>? beatBreath}) => BreathState(
    showType :showType?? this.showType,
    time : time ?? this.time,
    beatBreath : beatBreath?? this.beatBreath,
  );


}
