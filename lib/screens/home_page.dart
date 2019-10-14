import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/models/driver.dart';
import 'package:fonetracker/services/driver_service.dart';
import 'package:fonetracker/inject/injector.dart';
import 'package:fonetracker/utils/router.dart';
import 'package:fonetracker/widgets/homepage_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> drivers;

  @override
  void initState() {
    super.initState();
    drivers = fetchDrivers();
  }

  @override
  Widget build(BuildContext context) {
   return CupertinoPageScaffold(
     navigationBar: CupertinoNavigationBar(
       middle: Text("Home"),
     ),
     child: SafeArea(
       child: FutureBuilder<void>(
         future: drivers,
         builder: (context, snapshot){
           switch(snapshot.connectionState){
             case ConnectionState.none:
             case ConnectionState.waiting:
             case ConnectionState.active:
               return new Container(
                 child: Center(
                   child: CupertinoActivityIndicator(),
                 ),
               );
             case ConnectionState.done:
               return new Container(
                 child: Column(
                   children: <Widget>[
                     SizedBox(height: 16.0,),
                     HomePageItem(
                       pageName: "Driver Standings",
                       route: () => Router.of(context).push().driverStandings(),
                       assetPath: "assets/icons/helmet.png",
                     ),
                     HomePageItem(
                       pageName: "Races",
                       route: () => Router.of(context).push().schedule(),
                       assetPath: "assets/icons/award.png",
                     ),
                   ],
                 ),
               );
           }
           return null;
         }
       ),
     ),
   );
  }

  Future<void> fetchDrivers() async{
    var injector = Injector.of(context);
    DriverService service = injector.get();
    Map<String,Driver> map = await service.getDrivers();
    injector.register(value: map,qualifier: #drivers);
  }
}
