import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/models/race.dart';
import 'package:fonetracker/utils/router.dart';

class ScheduleItem extends StatefulWidget{

  final Race race;

  const ScheduleItem({Key key, this.race}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _ScheduleItemState();

}

class _ScheduleItemState extends State<ScheduleItem>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: new Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(width: 2.0, color: CupertinoTheme.of(context).primaryColor)
        ),
        height: 65.0,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 2.0, 16.0),
            child: Row(
              children: <Widget>[
                Text(widget.race.raceName),
                Spacer(),
                Text("Round " +  widget.race.round.toString()),
                SizedBox(width: 5.0,),
                Icon(CupertinoIcons.forward),
              ],
            ),
          ),
          onTap: () => Router.of(context).push().raceDetails(widget.race),
        ),
      ),
    );
  }

}