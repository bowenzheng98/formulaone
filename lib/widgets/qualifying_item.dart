import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/inject/inject.dart';
import 'package:fonetracker/inject/injector.dart';
import 'package:fonetracker/models/driver.dart';
import 'package:fonetracker/models/qualifying.dart';
import 'package:fonetracker/styles.dart';

import 'list_item.dart';

class QualifyingItem extends StatefulWidget {
  final QualifyingResult qualifyingResult;

  const QualifyingItem({Key key, this.qualifyingResult}) : super(key: key);

  @override
  _QualifyingItemState createState() => _QualifyingItemState();
}

class _QualifyingItemState extends State<QualifyingItem> {
  Inject injector;
  Map<String, Driver> drivers;
  Driver driver;

  @override
  void initState() {
    super.initState();
    injector = Injector.of(context);
    drivers = injector.get(qualifier: #drivers);
    driver = drivers[widget.qualifyingResult.driverId];
  }

  @override
  Widget build(BuildContext context) {
    return CustomListItem(
      padding: 4.0,
      radius: Radius.circular(8.0),
      blurRadius: 0.2,
      height: 110.0,
      child: new Container(
        height: 45.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 30.0,
                child: Center(
                  child: Text(
                    widget.qualifyingResult.position.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
              VerticalDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(driver.familyName),
                  const SizedBox(height: 8.0,),
                  widget.qualifyingResult.q3 == null || widget.qualifyingResult.q3 == "" ?
                  Text("Q3: - ", style: Styles.extra_light_text,) :
                  Text("Q3: " + widget.qualifyingResult.q3, style: Styles.extra_light_text,)
                  ,
                  widget.qualifyingResult.q2 == null || widget.qualifyingResult.q2 == "" ?
                  Text("Q2: - ", style: Styles.extra_light_text,) :
                  Text("Q2: " + widget.qualifyingResult.q2, style: Styles.extra_light_text,)
                  ,
                  widget.qualifyingResult.q1 == null || widget.qualifyingResult.q1 == "" ?
                  Text("Q1: - ", style: Styles.extra_light_text,) :
                  Text("Q1: " + widget.qualifyingResult.q1, style: Styles.extra_light_text,)
                  ,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
