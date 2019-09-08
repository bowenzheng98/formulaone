import 'package:flutter/widgets.dart';
import 'package:fonetracker/inject/inject.dart';
import 'package:fonetracker/inject/injector.dart';
import 'package:fonetracker/models/driver.dart';
import 'package:fonetracker/models/result.dart';

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
    return new Container(
      height: 45.0,
      child: Row(
        children: <Widget>[
          Text(widget.result.position.toString()),
          Spacer(),
          Text(driver.familyName),
          Spacer(),
          Text(widget.result.driverNumber.toString()),
          Spacer(),
          Text(widget.result.points.toString()),
        ],
      ),
    );
  }

}