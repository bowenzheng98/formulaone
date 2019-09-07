import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/models/standings.dart';
import 'package:fonetracker/services/standings_service.dart';
import 'package:fonetracker/widgets/standings_item.dart';

class DriverStandings extends StatefulWidget{
  @override
  _DriverStandingsState createState() => _DriverStandingsState();
}

class _DriverStandingsState extends State<DriverStandings> {
  bool isLoading;
  Standings standings;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
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
                          driver: standing.driver,
                          points: standing.points,
                        )
                    ],
                  ),
                ),
              ))),
    );
  }

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    var data = await StandingsService().getStandings();
    print(data);
    setState(() {
      standings = data;
      isLoading = false;
    });
  }
}