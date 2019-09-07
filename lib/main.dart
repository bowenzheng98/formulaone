import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fonetracker/screens/home.dart';
import 'package:fonetracker/services/standings_service.dart';
import 'package:fonetracker/utils/app_injector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "fone",
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,
      ),
      home: AppInjector(child: HomePage()),
    );
  }
}
