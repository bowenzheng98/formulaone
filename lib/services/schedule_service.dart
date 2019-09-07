import 'package:fonetracker/models/race.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ScheduleService{

  Future<List<Race>> getSchedule() async{
    var url = "http://ergast.com/api/f1/current.json";
    var response = await http.get(url);
    var json = convert.json.decode(response.body);
    List<Race> raceList = ( json["MRData"]["RaceTable"]["Races"] as List)
        .map((data) => Race.fromJson(data)).toList();
    return raceList;
  }
}