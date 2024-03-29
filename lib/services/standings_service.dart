import 'dart:convert' as convert;

import 'package:fonetracker/models/standing.dart';
import 'package:fonetracker/models/standings.dart';
import 'package:fonetracker/utils/nation_util.dart';
import 'package:http/http.dart' as http;

class StandingsService{

  CountryCode _countryCode = new CountryCode();

  Future<Standings> getStandings() async {
    final response = await http.get("http://ergast.com/api/f1/current/driverStandings.json");
    if (response.statusCode == 200){
      var json = convert.json.decode(response.body);
      int season = int.parse(json["MRData"]["StandingsTable"]["StandingsLists"][0]["season"]);
      int round = int.parse(json["MRData"]["StandingsTable"]["StandingsLists"][0]["round"]);
      List<Standing> standingList = (json["MRData"]["StandingsTable"]["StandingsLists"][0]["DriverStandings"] as List)
        .map((data) => Standing.fromJson(data)).toList();
      return Standings(season: season, round: round, standings: standingList);
    }
  }
}