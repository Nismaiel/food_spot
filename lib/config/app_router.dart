

import 'package:flutter/material.dart';
import 'package:food_spot/screens/home_screen.dart';
import 'package:food_spot/screens/location_screen.dart';

class AppRouter {
  static Route OnGenerateRoute(RouteSettings settings) {

    switch (settings.name) {
      case '/':
    return HomeScreen.route();
    case LocationScreen.routeName:
    return LocationScreen.route();
    default:
    return _errorRoute();
    }
    }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) =>
        Scaffold(appBar: AppBar(
          title:const Text('Error', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blueGrey[800],),backgroundColor: Colors.blueGrey[900],),
        settings: const RouteSettings(name: '/error'));
  }
}