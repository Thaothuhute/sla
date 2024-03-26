import 'package:equatable/equatable.dart';

class Option extends Equatable{
  final String musicPath;
  final String userId;

  const Option(this.musicPath, this.userId);

  @override
  List<Object> get props => [musicPath, userId];

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      json['musicPath'] as String,
      json['userId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'musicPath': musicPath,
      'userId': userId,
    };
  }
}