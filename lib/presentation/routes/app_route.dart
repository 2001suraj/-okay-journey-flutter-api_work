// ignore_for_file: prefer_const_constructors

import 'package:api_work/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      //Home screen
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(),
                  body: Center(child: Text('Route Not Found ! ! !')),
                ));
    }
  }
}
