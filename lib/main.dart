import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fonetracker/screens/home_page.dart';
import 'package:fonetracker/inject/app_injector.dart';
import 'package:fonetracker/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppInjector(
      child: CupertinoApp(
        title: "formula one tracker",
        theme: CupertinoThemeData(
          primaryColor: Styles.grey,
          textTheme: CupertinoTextThemeData(
            primaryColor: Styles.grey,
            textStyle: TextStyle(
                fontFamily: 'SFDisplayPro', color: Colors.black,
            ),
          )
        ),
        home: HomePage(),
      ),
    );
  }
}
