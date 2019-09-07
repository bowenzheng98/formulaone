import 'package:fonetracker/models/circuit.dart';

class Race{
  final int round;
  final int season;
  final String raceName;
  final DateTime date;
  final Circuit ciruit;

  Race({this.round, this.season, this.raceName, this.date, this.ciruit});

  factory Race.fromJson(Map<String, dynamic> json) {
    return new Race(
      round: int.parse(json["round"]),
      season: int.parse(json["season"]),
      raceName: json["raceName"],
      date: DateTime.parse(json["date"] + " " + json["time"]),
      ciruit: Circuit.fromJson(json["Circuit"]),
    );
  }
}