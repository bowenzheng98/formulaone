import 'package:fonetracker/models/qualifying.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class QualifyingResultsService{

  Future<List<QualifyingResult>> getQualifyingResults(int round) async {
    var url =  "http://ergast.com/api/f1/current/" + round.toString() + "/qualifying.json";
    var response = await http.get(url);
    var json = convert.json.decode(response.body);
    if ((json["MRData"]["RaceTable"]["Races"] as List).isEmpty ){
      return null;
    }
    List<QualifyingResult> results = ( json["MRData"]["RaceTable"]["Races"][0]["QualifyingResults"] as List)
        .map((data) => QualifyingResult.fromJson(data)).toList();
    return results;
  }

}