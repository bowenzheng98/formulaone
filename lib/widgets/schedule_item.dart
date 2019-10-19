import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/models/race.dart';
import 'package:fonetracker/screens/race_page.dart';
import 'package:fonetracker/utils/router.dart';
import 'package:fonetracker/widgets/list_item.dart';

class ScheduleItem extends StatefulWidget{

  final Race race;

  const ScheduleItem({Key key, this.race}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _ScheduleItemState();

}

class _ScheduleItemState extends State<ScheduleItem> with TickerProviderStateMixin{

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return CustomListItem(
      padding: 4.0,
      radius: Radius.circular(8.0),
      blurRadius: 0.8,
      height: 55.0,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Padding(
          padding: const EdgeInsets.all(16.0  ),
          child: Row(
            children: <Widget>[
              Text(widget.race.raceName),
              Spacer(),
              Text("Round " +  widget.race.round.toString()),
              SizedBox(width: 5.0,),
            ],
          ),
        ),
        onTap: (){
          Navigator.of(context).push<void>(CupertinoPageRoute(
            builder: (context) => RacePage(race: widget.race,),
            fullscreenDialog: true,
          ));
        },
      ),
    );
  }

}