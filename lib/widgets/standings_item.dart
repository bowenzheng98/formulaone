import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/models/driver.dart';
import 'package:fonetracker/utils/nation_util.dart';

import '../styles.dart';
import 'list_item.dart';

class StandingsItem extends StatelessWidget {
  final Driver driver;
  final int points;

  const StandingsItem({Key key, this.driver, this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListItem(
      padding: 4.0,
      radius: Radius.circular(8.0),
      blurRadius: 0.1,
      height: 45.0,
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), bottomLeft: Radius.circular(8.0)),
                  child: Container(
                    height: 45.0,
                    color: CupertinoColors.lightBackgroundGray,
                    child: Image(
                        image: AssetImage("assets/flags/" + CountryCode.getCountryCode(driver.nationality) + ".png")
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(driver.giveName + " " + driver.familyName),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(points.toString()),
          )
        ],
      ),
    );
  }
}