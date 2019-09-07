import 'dart:typed_data';

class Driver{
  final String id;
  final int number;
  final String giveName;
  final String familyName;
  final String nationality;
  Uint8List imageBytes;

  Driver({this.id, this.number, this.giveName, this.familyName, this.nationality});

  factory Driver.fromJson(Map<String, dynamic> json){
    return new Driver(
      id: json["driverId"],
      number: int.parse(json["permanentNumber"]),
      giveName: json["givenName"],
      familyName: json["familyName"],
      nationality: json["nationality"],
    );
  }
}