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
      height: 80.0,
      child: new Container(
        height: 45.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    widget.qualifyingResult.position.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32.0,
                    ),
                  ),
                  Text(driver.familyName),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
