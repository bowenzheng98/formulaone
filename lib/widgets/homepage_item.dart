import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePageItem extends StatelessWidget {
  final String pageName;
  final VoidCallback route;
  final String assetPath;

  const HomePageItem(
      {Key key,
      this.pageName,
      this.route,
      this.assetPath,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
      child: GestureDetector(
        onTap: route,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color.fromRGBO(229, 229, 234, 0.9),
                  blurRadius: 8.0,
                )
              ]),
          height: 300.0,
          width: 400.0,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 98.0),
                child: Center(
                  child: Image(
                    image: AssetImage(assetPath),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ItemDetails(
                  pageName: pageName,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  final String pageName;

  const ItemDetails({Key key, this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FrostyBackground(
      color: Color(0x90ffffff),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 50.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                pageName,
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FrostyBackground extends StatelessWidget {
  final Color color;
  final double intensity;
  final Widget child;

  const FrostyBackground({Key key, this.color, this.intensity = 25, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: intensity, sigmaY: intensity),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
          ),
          child: child,
        ),
      ),
    );
  }
}
