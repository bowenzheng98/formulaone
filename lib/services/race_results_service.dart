import 'package:fonetracker/models/result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RaceResultsService{

  Future<List<RaceResult>> getRaceResults(String round) async{
    var url =  "http://ergast.com/api/f1/current/" + round + "/results.json";
    var response = await http.get(url);
    var json = convert.json.decode(response.body);
    List<RaceResult> results = ( json["MRData"]["RaceTable"]["Races"]["Results"] as List)
        .map((data) => RaceResult.fromJson(data)).toList();
    return results;
  }
}