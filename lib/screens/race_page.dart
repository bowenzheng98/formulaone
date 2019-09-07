import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/models/race.dart';
import 'package:fonetracker/models/result.dart';

class RacePage extends StatefulWidget {
  final Race race;

  const RacePage({Key key, this.race}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RacePageState();
}

class _RacePageState extends State<RacePage> {

  int _currentSegment;
  Map<int, Widget> _page;
  bool _loading;


  @override
  void initState() {
    super.initState();
    _currentSegment = 0;
    _loading = true;
    (() async {
      setState(() {
        _loading = true;
      });
      _page = <int, Widget>{
        0: _buildDetails(widget.race),
        1: await _buildResults(),
      };
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final Map<int, Widget> segmentWidgets = const <int, Widget>{
      0: Text("Details"),
      1: Text("Results")
    };

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(CupertinoIcons.back, size: 25.0)),
        middle: Text(widget.race.raceName),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            SizedBox(
              width: 500.0,
              child: CupertinoSegmentedControl<int>(
                children: segmentWidgets,
                groupValue: _currentSegment,
                onValueChanged: (int val){
                  setState(() {
                    _currentSegment = val;
                  });
                },
              ),
            ),
            SizedBox(height: 8.0,),
            _loading ? Center(child: CupertinoActivityIndicator()) : Expanded(child: _page[_currentSegment],)
          ],
        ),
      ),
    );
  }

  Widget _buildDetails(Race race){
    return new Column(
      children: <Widget>[
        Text(race.raceName),
        SizedBox(height: 8.0,),
        Text(race.round.toString()),
        SizedBox(height: 8.0,),
        Text(race.season.toString()),
        SizedBox(height: 8.0,),
        Text(race.ciruit.circuitName),
        SizedBox(height: 8.0,),
      ],
    );
  }

  Future<Widget> _buildResults() async{
    return Text("test");
  }

  Future<List<RaceResult>> fetchRaceResults() async{

  }

}
