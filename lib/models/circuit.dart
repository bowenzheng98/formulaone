class Circuit{
  final String circuitId;
  final String circuitName;

  Circuit({this.circuitId, this.circuitName});

  factory Circuit.fromJson(Map<String, dynamic> json){
    return new Circuit(
      circuitId: json["circuitId"],
      circuitName: json["circuitName"]
    );
  }

}