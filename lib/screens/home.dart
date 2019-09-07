import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/models/standings.dart';
import 'package:fonetracker/services/standings_service.dart';
import 'package:fonetracker/utils/router.dart';
import 'package:fonetracker/widgets/homepage_item.dart';
import 'package:fonetracker/widgets/standings_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return CupertinoPageScaffold(
     navigationBar: CupertinoNavigationBar(
       middle: Text("Home"),
     ),
     child: SafeArea(
       child: Column(
         children: <Widget>[
           HomePageItem(pageName: "Driver Standings", route: () => Router.of(context).push().driverStandings(),)
         ],
       ),
     ),
   );
  }
}
