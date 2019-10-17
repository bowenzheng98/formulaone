import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonetracker/styles.dart';

class HomePageItem extends StatelessWidget {
  final String pageName;
  final String details;
  final VoidCallback route;
  final String assetPath;
  final Color color;

  const HomePageItem({
    Key key,
    this.pageName,
    this.route,
    this.assetPath, this.color, this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
      child: PressableCard(
        onPressed: route,
        child: Container(
          decoration: BoxDecoration(
            color: CupertinoColors.white,
          ),
          height: 300.0,
          width: 400.0,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                    details: details,
                    color: color,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  final String pageName;
  final String details;
  final Color color;

  const ItemDetails({Key key, this.pageName, this.color, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Accent(
      color: color,
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
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                details,
                style: TextStyle(
                  color: CupertinoColors.inactiveGray,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Accent extends StatelessWidget {
  final Color color;
  final Widget child;

  const Accent({Key key, this.color, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
        ),
        child: child,
      )
    );
  }

}

class PressableCard extends StatefulWidget {
  const PressableCard({
    @required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.upElevation = 4,
    this.downElevation = 0.8,
    this.shadowColor = CupertinoColors.black,
    this.duration = const Duration(milliseconds: 100),
    this.onPressed,
    Key key,
  })  : assert(child != null),
        assert(borderRadius != null),
        assert(upElevation != null),
        assert(downElevation != null),
        assert(shadowColor != null),
        assert(duration != null),
        super(key: key);

  final VoidCallback onPressed;

  final Widget child;

  final BorderRadius borderRadius;

  final double upElevation;

  final double downElevation;

  final Color shadowColor;

  final Duration duration;

  @override
  _PressableCardState createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard> {
  bool cardIsDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => cardIsDown = false);
        if (widget.onPressed != null) {
          widget.onPressed();
        }
      },
      onTapDown: (details) => setState(() => cardIsDown = true),
      onTapCancel: () => setState(() => cardIsDown = false),
      child: AnimatedPhysicalModel(
        elevation: cardIsDown ? widget.downElevation : widget.upElevation,
        borderRadius: widget.borderRadius,
        shape: BoxShape.rectangle,
        shadowColor: widget.shadowColor,
        duration: widget.duration,
        color: CupertinoColors.lightBackgroundGray,
        child: ClipRRect(
          borderRadius: widget.borderRadius,
          child: widget.child,
        ),
      ),
    );
  }
}