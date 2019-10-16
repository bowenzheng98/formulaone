import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/inject/inject.dart';
import 'package:fonetracker/inject/injector.dart';
import 'package:fonetracker/models/latest.dart';
import 'package:fonetracker/models/result.dart';
import 'package:fonetracker/services/latest_results_service.dart';

import 'package:fonetracker/widgets/race_result_item.dart';

class LatestResultPage extends StatefulWidget {
  @override
  _LatestResultPageState createState() => _LatestResultPageState();
}

class _LatestResultPageState extends State<LatestResultPage> {
  Inject injector;
  Future<LatestResult> latestResults;

  @override
  void initState() {
    super.initState();
    injector = Injector.of(context);
    latestResults = fetchLatestResults();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        middle: Text("Latest Results"),
        previousPageTitle: "Home",
      ),
      child: Container(
        color: CupertinoColors.extraLightBackgroundGray,
        child: SafeArea(
            child: FutureBuilder<LatestResult>(
          future: latestResults,
          builder:
              (BuildContext context, AsyncSnapshot<LatestResult> snapshot) {
            if (snapshot.hasData) {
              return CupertinoScrollbar(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 8.0),
                        child: Text(
                          "Round " + snapshot.data.round.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      for (RaceResult result in snapshot.data.results)
                        RaceResultItem(result: result),
                    ],
                  ),
                ),
              );
            } else {
              return new Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
        )),
      ),
    );
  }

  Future<LatestResult> fetchLatestResults() async {
    if (injector.get<LatestResult>(qualifier: #latestResult) == null) {
      var data = await LatestResultsService().getLatestResults();
      injector.register(value: data, qualifier: #latestResult);
      return data;
    } else {
      return injector.get<LatestResult>(qualifier: #latestResult);
    }
  }
}
