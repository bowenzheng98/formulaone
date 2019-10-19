import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/models/race.dart';
import 'package:fonetracker/screens/race_page.dart';
import 'package:fonetracker/utils/router.dart';
import 'package:fonetracker/widgets/homepage_item.dart';
import 'package:fonetracker/widgets/list_item.dart';

class ScheduleItem extends StatefulWidget{

  final Race race;

  const ScheduleItem({Key key, this.race}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _ScheduleItemState();

}

class _ScheduleItemState extends State<ScheduleItem> with TickerProviderStateMixin{

  AnimationController controller;
  VoidCallback onPressed;

  @override
  void initState() {
    super.initState();
    onPressed = () =>  Navigator.of(context).push<void>(CupertinoPageRoute(
      builder: (context) => RacePage(race: widget.race,),
      fullscreenDialog: true,
    ));
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: PressableCard(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        upElevation: 2,
        downElevation: 1,
        onPressed: () =>  Navigator.of(context).push<void>(CupertinoPageRoute(
          builder: (context) => RacePage(race: widget.race,),
          fullscreenDialog: true,
        )),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
            child: Row(
              children: <Widget>[
                Text(widget.race.raceName),
                Spacer(),
                Text("Round " +  widget.race.round.toString()),
                SizedBox(width: 5.0,),
                Icon(Icons.more_vert),
              ],
            ),
          ),
        ),
      ),
    );
  }

}