import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/models/driver.dart';
import 'package:fonetracker/utils/nation_util.dart';

class StandingsItem extends StatefulWidget{

  final Driver driver;
  final int points;

  const StandingsItem({Key key, this.driver, this.points}) : super(key: key);

  @override
  _StandingsItemState createState() => _StandingsItemState();
}

class _StandingsItemState extends State<StandingsItem> {

  CountryCode _countryCode;

  @override
  void initState() {
    super.initState();
    _countryCode = new CountryCode();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 45.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Image(
              image: AssetImage("assets/flags/" + CountryCode.getCountryCode(widget.driver.nationality) + ".png")
            ),
            const SizedBox(width: 10.0),
            Text(widget.driver.giveName + " " + widget.driver.familyName),
            Spacer(),
            Text(widget.points.toString())
          ],
        ),
      ),
    );
  }
}