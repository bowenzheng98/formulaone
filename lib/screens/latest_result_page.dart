import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/inject/inject.dart';
import 'package:fonetracker/inject/injector.dart';
import 'package:fonetracker/models/result.dart';
import 'package:fonetracker/services/latest_results_service.dart';
import 'package:fonetracker/styles.dart';
import 'package:fonetracker/widgets/race_result_item.dart';

class LatestResultPage extends StatefulWidget {

  @override
  _LatestResultPageState createState() => _LatestResultPageState();
}

class _LatestResultPageState extends State<LatestResultPage> {
  Inject injector;
  Future<List<RaceResult>> latestReults;

  @override
  void initState() {
    super.initState();
    injector = Injector.of(context);
    latestReults = fetchLatestResults();
  }


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.white,
          leading: Container(
            child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(CupertinoIcons.back, size: 25.0,)
            ),
          ),
          middle: Text("Latest Results"),
      ),
      child: Container(
        color: Styles.background_grey,
        child: SafeArea(
          child: FutureBuilder<List<RaceResult>>(
            future: latestReults,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if (snapshot.hasData){
                return CupertinoScrollbar(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ListView(
                      children: <Widget>[
                        for (RaceResult result in snapshot.data)
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
          )
        ),
      ),
    );
  }

  Future<List<RaceResult>> fetchLatestResults() async {
    if (injector.get<List<RaceResult>>(qualifier: #latestResult) == null){
      var data = await LatestResultsService().getLatestResults();
      injector.register(value: data, qualifier: #latestResult);
      return data;
    } else {
      return injector.get<List<RaceResult>>(qualifier: #latestResult);
    }
  }
}