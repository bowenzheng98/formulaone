class RaceResult{
  final int driverNumber;
  final int position;
  final int points;
  final String positionText;
  final String driverId;

  RaceResult({this.driverNumber, this.position, this.points, this.positionText, this.driverId});
  
  factory RaceResult.fromJson(Map<String, dynamic> json){
    return new RaceResult(
      driverNumber: int.parse(json["number"]),
      position: int.parse(json["position"]),
      positionText: json["positionText"],
      points: int.parse(json["points"]),
      driverId: json["Driver"]["driverId"],
    );
  }
}