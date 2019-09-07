
import 'package:flutter/material.dart';
import 'package:fonetracker/services/driver_service.dart';
import 'package:fonetracker/utils/router.dart';
import 'package:http/http.dart';

import 'inject.dart';
import 'injector.dart';

class AppInjector extends Injector {
  AppInjector({
    @required Widget child,
  }) : super(child: child, bootstrap: bootstrap);
}

void bootstrap(Inject inject) {
  inject.register(factory: _httpClient, singleton: true);
  inject.register(factory: _driverService, singleton: true);
}

Client _httpClient(Inject inject) {
  return Client();
}

DriverService _driverService(Inject inject){
  return DriverService();
}
