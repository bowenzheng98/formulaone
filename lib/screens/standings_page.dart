import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/inject/inject.dart';
import 'package:fonetracker/inject/injector.dart';
import 'package:fonetracker/models/driver.dart';
import 'package:fonetracker/models/standing.dart';
import 'package:fonetracker/models/standings.dart';
import 'package:fonetracker/services/standings_service.dart';
import 'package:fonetracker/styles.dart';
import 'package:fonetracker/widgets/standings_item.dart';

class DriverStandingsPage extends StatefulWidget {
  @override
  _DriverStandingsState createState() => _DriverStandingsState();
}

class _DriverStandingsState extends State<DriverStandingsPage> {
  Map<String, Driver> drivers;
  Inject injector;
  bool isLoading;
  Future<Standings> standings;

  @override
  void initState() {
    super.initState();
    injector = Injector.of(context);
    drivers = injector.get(qualifier: #drivers);
    standings = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        leading: Container(
          child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(CupertinoIcons.back, size: 25.0)),
        ),
        middle: Text("Standings"),
      ),
      child: Container(
        color: Styles.background_grey,
        child: SafeArea(
          child: Center(
            child: FutureBuilder<Standings>(
              future: standings,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return new CupertinoScrollbar(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 8.0),
                            child: Text(snapshot.data.season.toString() +
                                " Round " +
                                snapshot.data.round.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          for (Standing standing in snapshot.data.standings)
                            StandingsItem(
                              driver: drivers[standing.driver],
                              points: standing.points,
                            )
                        ],
                      ),
                    ),
                  );
                }
                return CupertinoActivityIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<Standings> fetchData() async {
    if (injector.get<Standings>(qualifier: #standings) == null) {
      var data = await StandingsService().getStandings();
      injector.register(value: data, qualifier: #standings);
      return data;
    } else {
      return injector.get<Standings>(qualifier: #standings);
    }
  }
}
