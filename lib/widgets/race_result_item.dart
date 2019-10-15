import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/inject/inject.dart';
import 'package:fonetracker/inject/injector.dart';
import 'package:fonetracker/models/driver.dart';
import 'package:fonetracker/models/result.dart';
import 'package:fonetracker/widgets/list_item.dart';

class RaceResultItem extends StatefulWidget{

  final RaceResult result;

  const RaceResultItem({Key key, this.result}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RaceResultItemState();

}

class _RaceResultItemState extends State<RaceResultItem>{

  Inject injector;
  Map<String, Driver> drivers;
  Driver driver;

  @override
  void initState() {
    super.initState();
    injector = Injector.of(context);
    drivers = injector.get(qualifier: #drivers);
    driver = drivers[widget.result.driverId];
  }

  @override
  Widget build(BuildContext context) {
    return CustomListItem(
      padding: 4.0,
      radius: Radius.circular(8.0),
      blurRadius: 0.2,
      height: 45.0,
      child: new Container(
        height: 45.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Row(
            children: <Widget>[
              SizedBox(width: 20.0 ,child: Text(widget.result.position.toString())),
              VerticalDivider(thickness: 1.0,),
              SizedBox(width: 5.0,),
              Text(driver.giveName + " " + driver.familyName),
              Spacer(),
              Text(widget.result.points.toString())
            ],
          ),
        ),
      ),
    );
  }

}