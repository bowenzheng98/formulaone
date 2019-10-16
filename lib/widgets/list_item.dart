import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../styles.dart';

class CustomListItem extends StatelessWidget {
  final double padding;
  final Widget child;
  final Radius radius;
  final double blurRadius;
  final double height;

  const CustomListItem(
      {Key key, this.padding, this.radius, this.child, this.blurRadius, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: new Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(radius),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: CupertinoColors.darkBackgroundGray,
                blurRadius: blurRadius,
              )
            ]),
        height: height,
        child: child,
      ),
    );
  }
}
