import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fonetracker/screens/home.dart';
import 'package:fonetracker/services/standings_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "fone",
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomePage(standings: StandingsService().getStandings(),),
    );
  }
}
