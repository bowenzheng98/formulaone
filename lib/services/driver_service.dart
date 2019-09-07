import 'package:fonetracker/models/driver.dart';
import 'package:http/http.dart' as http;

class DriverService{


  Future<List<Driver>> getDrivers() async{
    var now = DateTime.now();
    var currentYear = now.year;
    var url = "http://ergast.com/api/f1/" + currentYear.toString() + "/drivers.json";
    var response = await http.get(url);
    print(response);

  }
}