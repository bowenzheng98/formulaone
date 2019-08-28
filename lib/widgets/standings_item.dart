import 'package:flutter/widgets.dart';
import 'package:fonetracker/models/driver.dart';

class StandingsItem extends StatelessWidget{

  final Driver driver;
  final int points;

  const StandingsItem({Key key, this.driver, this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 45.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Text(driver.giveName + " " + driver.familyName),
            Spacer(),
            Text(points.toString())
          ],
        ),
      ),
    );
  }

}