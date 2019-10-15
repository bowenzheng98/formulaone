import 'package:flutter/cupertino.dart';
import 'package:fonetracker/models/race.dart';
import 'package:fonetracker/screens/latest_result_page.dart';
import 'package:fonetracker/screens/race_page.dart';
import 'package:fonetracker/screens/schedule_page.dart';
import 'package:fonetracker/screens/standings_page.dart';

typedef RouteAction<R, T> = R Function(PageRoute<T> route);

class _Routes<R> {
  _Routes(this._action);

  final RouteAction _action;

  R _execute(WidgetBuilder builder) {
    return _action(CupertinoPageRoute(builder: builder));
  }

  R driverStandings() => _execute((BuildContext context) => DriverStandingsPage());

  R schedule() => _execute((BuildContext context) => SchedulePage());

  R raceDetails(Race race) => _execute((BuildContext context) => RacePage(race: race));

  R latestResults() => _execute((BuildContext context) => LatestResultPage());
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