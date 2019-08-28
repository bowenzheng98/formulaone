import 'dart:convert';

import 'package:fonetracker/models/standing.dart';
import 'package:fonetracker/models/standings.dart';
import 'package:fonetracker/utils/nation_util.dart';
import 'package:http/http.dart' as http;

class StandingsService{

  CountryCode _countryCode = new CountryCode();

  Future<Standings> getStandings() async {
    final response = await http.get("http://ergast.com/api/f1/current/driverStandings.json");

    if (response.statusCode == 200){
      var body = json.decode(response.body);
      int season = int.parse(body["MRData"]["StandingsTable"]["StandingsLists"][0]["season"]);
      int round = int.parse(body["MRData"]["StandingsTable"]["StandingsLists"][0]["round"]);
      List<Standing> standingList = (body["MRData"]["StandingsTable"]["StandingsLists"][0]["DriverStandings"] as List)
        .map((data) => Standing.fromJson(data)).toList();
      print("Start");
      for (Standing standing in standingList){
        var response = await http.get("https://www.countryflags.io/"+ _countryCode.getCountryCode(standing.driver.nationality) +  "/flat/64.png");
        standing.driver.imageBytes = response.bodyBytes;
      }
      print("End");
      return Standings(season: season, round: round, standings: standingList);
    }
  }
}