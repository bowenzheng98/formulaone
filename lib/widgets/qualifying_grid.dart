import 'package:flutter/widgets.dart';
import 'package:fonetracker/models/qualifying.dart';
import 'package:fonetracker/widgets/qualifying_item.dart';

class QualifyingGrid extends StatefulWidget {
  final List<QualifyingResult> qualifying;

  const QualifyingGrid({Key key, this.qualifying}) : super(key: key);

  @override
  _QualifyingGridState createState() => _QualifyingGridState();
}

class _QualifyingGridState extends State<QualifyingGrid> {

  List<QualifyingResult> odd;
  List<QualifyingResult> even;

  @override
  void initState() {
    super.initState();
    odd = new List();
    even = new List();
    for (QualifyingResult result in widget.qualifying){
      if (result.position.isOdd){
        odd.add(result);
      } else {
        even.add(result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width /2.2,
                      child: Column(
                        children: <Widget>[
                          for (QualifyingResult result in odd)
                            Padding(padding: EdgeInsets.all(8.0),
                                child: QualifyingItem(qualifyingResult: result,))
                        ],
                      ),
                    ),
                    Container(
                    width: MediaQuery.of(context).size.width /2.2,
                      margin: EdgeInsets.fromLTRB(0.0, 52.0, 0.0, 0.0),
                      child: Column(
                        children: <Widget>[
                          for (QualifyingResult result in even)
                            Padding(padding: EdgeInsets.all(8.0),
                                child: QualifyingItem(qualifyingResult: result,))
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}