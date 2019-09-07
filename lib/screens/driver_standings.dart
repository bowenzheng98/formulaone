import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/models/driver.dart';
import 'package:fonetracker/models/standings.dart';
import 'package:fonetracker/services/standings_service.dart';
import 'package:fonetracker/utils/inject.dart';
import 'package:fonetracker/utils/injector.dart';
import 'package:fonetracker/widgets/standings_item.dart';

class DriverStandings extends StatefulWidget{
  @override
  _DriverStandingsState createState() => _DriverStandingsState();
}

class _DriverStandingsState extends State<DriverStandings> {

  Map<String, Driver> drivers;
  Inject injector;
  bool isLoading;
  Standings standings;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    injector = Injector.of(context);
    drivers = injector.get(qualifier: #drivers);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Standings"),
      ),
      child: SafeArea(
          child: Center(
              child: isLoading
                  ? CupertinoActivityIndicator()
                  : CupertinoScrollbar(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: <Widget>[
                      for (var standing in standings.standings)
                        StandingsItem(
                          driver: drivers[standing.driver],
                          points: standing.points,
                        )
                    ],
                  ),
                ),
              ))),
    );
  }

  Future<void> _fetchData() async {
    setState(() {
      isLoading = true;
    });
    var data = await StandingsService().getStandings();
    setState(() {
      standings = data;
      isLoading = false;
    });
  }
}