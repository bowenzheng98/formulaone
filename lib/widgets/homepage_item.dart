import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePageItem extends StatefulWidget{

  final String pageName;
  final VoidCallback route;

  const HomePageItem({Key key, this.pageName, this.route}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageItem>{


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Row(
            children: <Widget>[
              Text(widget.pageName),
              Spacer(),
              Container(
                child: Icon(CupertinoIcons.forward),
              )
            ],
          ),
          onTap: widget.route,
        ),
      ),
    );
  }

}