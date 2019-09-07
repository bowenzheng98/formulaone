import 'package:flutter/cupertino.dart';
import 'package:fonetracker/screens/driver_standings.dart';

typedef RouteAction<R, T> = R Function(PageRoute<T> route);

class _Routes<R> {
  _Routes(this._action);

  final RouteAction _action;

  R _execute(WidgetBuilder builder) {
    return _action(CupertinoPageRoute(builder: builder));
  }

  R driverStandings() => _execute((BuildContext context) => DriverStandings());
}

/// Idiomatic API for pushing routes
///
/// e.g. Router.of(context).push().homePage()
class Router {
  Router.of(this.context);

  final BuildContext context;

  _Routes<Future<T>> push<T extends Object>() {
    return _Routes(
          (route) => Navigator.of(context).push(route),
    );
  }

  _Routes<Future<T>> pushReplacement<T extends Object, TO extends Object>({TO result}) {
    return _Routes(
          (route) => Navigator.of(context).pushReplacement(route, result: result),
    );
  }
}