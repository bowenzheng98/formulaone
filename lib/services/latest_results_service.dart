import 'package:fonetracker/models/latest.dart';
import 'package:fonetracker/models/result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LatestResultsService{

  Future<LatestResult> getLatestResults() async {
    var url = "http://ergast.com/api/f1/current/last/results.json";
    var response = await http.get(url);
    var json = convert.json.decode(response.body);
    if ((json["MRData"]["RaceTable"]["Races"] as List).isEmpty ){
      return null;
    }
    List<RaceResult> results = ( json["MRData"]["RaceTable"]["Races"][0]["Results"] as List)
        .map((data) => RaceResult.fromJson(data)).toList();
    LatestResult latestResult = new LatestResult();
    latestResult.round  = int.parse(json["MRData"]["RaceTable"]["round"]);
    latestResult.results = results;
    print(LatestResult);
    return latestResult;
  }
}