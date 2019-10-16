import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/inject/inject.dart';
import 'package:fonetracker/inject/injector.dart';
import 'package:fonetracker/models/race.dart';
import 'package:fonetracker/models/result.dart';
import 'package:fonetracker/services/race_results_service.dart';
import 'package:fonetracker/styles.dart';
import 'package:fonetracker/widgets/race_result_item.dart';

class RacePage extends StatefulWidget {
  final Race race;

  const RacePage({Key key, this.race}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RacePageState();
}

class _RacePageState extends State<RacePage> {
  int currentSegment;
  Map<int, Widget> page;
  Inject injector;
  Future<List<RaceResult>> results;

  @override
  void initState() {
    super.initState();
    injector = Injector.of(context);
    currentSegment = 0;
    results = fetchRaceResults();
    page = <int, Widget>{
      0: _buildDetails(widget.race),
      1: _buildResults(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final Map<int, Widget> segmentWidgets = const <int, Widget>{
      0: Text("Details"),
      1: Text("Results")
    };

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        middle: Text(widget.race.raceName),
      ),
      child: Container(
        color: CupertinoColors.lightBackgroundGray,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              SizedBox(
                width: 500.0,
                child: CupertinoSegmentedControl<int>(
                  children: segmentWidgets,
                  groupValue: currentSegment,
                  onValueChanged: (int val) {
                    setState(() {
                      currentSegment = val;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Expanded(child: page[currentSegment]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetails(Race race) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(race.raceName),
        SizedBox(
          height: 8.0,
        ),
        Text(race.round.toString()),
        SizedBox(
          height: 8.0,
        ),
        Text(race.season.toString()),
        SizedBox(
          height: 8.0,
        ),
        Text(race.ciruit.circuitName),
        SizedBox(
          height: 8.0,
        ),
      ],
    );
  }

  Widget _buildResults() {
    return new FutureBuilder<List<RaceResult>>(
      future: results,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: new CupertinoScrollbar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView(
                  children: <Widget>[
                    for (RaceResult result in snapshot.data)
                      RaceResultItem(result: result),
                  ],
                ),
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done && snapshot.data == null) {
          return new SizedBox.shrink();
        }
        return new Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }

  Future<List<RaceResult>> fetchRaceResults() async {
    return await RaceResultsService().getRaceResults(widget.race.round);
  }
}
