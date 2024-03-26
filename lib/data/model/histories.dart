import 'package:equatable/equatable.dart';

class Histories extends Equatable{
  final String userId;
  final DateTime dateTime;
  final int timeSleep;
  final int actuallyTime;

  const Histories({required this.userId,required this.dateTime,required this.timeSleep,required this.actuallyTime});
  @override
  List<Object> get props => [userId, dateTime, timeSleep, actuallyTime];

  factory Histories.fromJson(Map<String, dynamic> json) {
    return Histories(
      userId: json['userId'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      timeSleep: json['timeSleep'] as int,
      actuallyTime: json['actuallyTime'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'dateTime': dateTime.toIso8601String(),
      'timeSleep': timeSleep,
      'actuallyTime': actuallyTime,
    };
  }
}
