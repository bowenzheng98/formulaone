import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/inject/inject.dart';
import 'package:fonetracker/inject/injector.dart';
import 'package:fonetracker/models/race.dart';
import 'package:fonetracker/services/schedule_service.dart';
import 'package:fonetracker/styles.dart';
import 'package:fonetracker/widgets/schedule_item.dart';

class SchedulePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>{

  Inject injector;
  Future<List<Race>> schedule;

  @override
  void initState() {
    super.initState();
    injector = Injector.of(context);
    schedule = fetchSchedule();
  }
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        middle: Text("Schedule"),
        previousPageTitle: "Home",
      ),
      child: Container(
        color: CupertinoColors.extraLightBackgroundGray,
        child: SafeArea(
          bottom: false,
          child: Center(
            child: FutureBuilder<List<Race>>(
              future: schedule,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return CupertinoScrollbar(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListView(
                        children: <Widget>[
                          const SizedBox(height: 8.0,),
                          for (Race race in snapshot.data)
                            ScheduleItem(race: race,)
                        ],
                      ),
                    ),
                  );
                }
                return CupertinoActivityIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Race>> fetchSchedule() async{
    if (injector.get<List<Race>>(qualifier: #raceList) == null){
      var data = await ScheduleService().getSchedule();
      injector.register(value: data, qualifier: #raceList);
      return data;
    } else {
      return injector.get<List<Race>>(qualifier: #raceList);
    }
  }
}