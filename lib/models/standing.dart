import 'driver.dart';

class Standing{

  final String driver;
  final int position;
  final int points;
  final int wins;

  Standing({this.driver, this.position, this.points, this.wins});

  factory Standing.fromJson(Map<String, dynamic> json){
    return new Standing(
      driver: json["Driver"]["driverId"],
      position: int.parse(json["position"]),
      points: int.parse(json["points"]),
      wins: int.parse(json["wins"]),
    );
  }

}

