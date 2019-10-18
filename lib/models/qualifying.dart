class QualifyingResult {
  final int number;
  final int position;
  final String driverId;
  final String q1;
  final String q2;
  final String q3;

  QualifyingResult({this.number, this.position, this.driverId, this.q1, this.q2, this.q3});

  factory QualifyingResult.fromJson(Map<String, dynamic> json){
    return new QualifyingResult(
      number: int.parse(json["number"]),
      position: int.parse(json["position"]),
      driverId: json["Driver"]["driverId"],
      q1: json["Q1"],
      q2: json["Q2"],
      q3: json["Q3"],
    );
  }

}