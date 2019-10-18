import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/inject/inject.dart';
import 'package:fonetracker/inject/injector.dart';
import 'package:fonetracker/models/driver.dart';
import 'package:fonetracker/models/qualifying.dart';

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
      height: 45.0,
      child: new Container(
        height: 45.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Row(
            children: <Widget>[
              SizedBox(width: 20.0 ,child: Text(widget.qualifyingResult.position.toString())),
              const VerticalDivider(thickness: 1.0,),
              SizedBox(width: 5.0,),
              Text(driver.giveName + " " + driver.familyName),
              Spacer(),
              if (widget.qualifyingResult.q3 != null)
                SizedBox(width: 80.0,
                    child: Row(
                      children: <Widget>[
                        Text("Q3  ", style: TextStyle(fontWeight: FontWeight.w100),),
                        Text(widget.qualifyingResult.q3)
                      ],
                    )
                ),
              if (widget.qualifyingResult.q3 == null && widget.qualifyingResult.q2 != null)
                SizedBox(width: 80.0,
                    child: Row(
                      children: <Widget>[
                        Text("Q2  ", style: TextStyle(fontWeight: FontWeight.w100),),
                        Text(widget.qualifyingResult.q2)
                      ],
                    )
                ),
              if (widget.qualifyingResult.q3 == null && widget.qualifyingResult.q2 == null)
                SizedBox(width: 80.0,
                    child: Row(
                      children: <Widget>[
                        Text("Q1  ", style: TextStyle(fontWeight: FontWeight.w100),),
                        Text(widget.qualifyingResult.q1)
                      ],
                    )
                ),
            ],
          ),
        ),
      ),
    );
  }
}