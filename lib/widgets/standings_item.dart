import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/models/driver.dart';
import 'package:fonetracker/utils/nation_util.dart';

import '../styles.dart';

class StandingsItem extends StatelessWidget {
  final Driver driver;
  final int points;

  const StandingsItem({Key key, this.driver, this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Styles.shadow_grey,
              blurRadius: 0.1,
            )
          ]
        ),
        height: 45.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage("assets/flags/" + CountryCode.getCountryCode(driver.nationality) + ".png")
              ),
              VerticalDivider(),
              Text(driver.giveName + " " + driver.familyName),
              Spacer(),
              Text(points.toString())
            ],
          ),
        ),
      ),
    );
  }
}