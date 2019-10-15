import 'dart:collection';
import 'dart:convert' as convert;

import 'package:fonetracker/models/driver.dart';
import 'package:http/http.dart' as http;

class DriverService{

  Future<Map<String,Driver>> getDrivers() async{
    Map<String,Driver> driverMap = new HashMap();
    var now = DateTime.now();
    var currentYear = now.year;
    var url = "http://ergast.com/api/f1/" + currentYear.toString() + "/drivers.json";
    var response = await http.get(url);
    if (response.statusCode == 200){
      var json = convert.json.decode(response.body);
      for (var driver in (json["MRData"]["DriverTable"]["Drivers"] as List)){
        driverMap.putIfAbsent(driver["driverId"], () => Driver.fromJson(driver));
      }
    }
    return driverMap;
  }
}