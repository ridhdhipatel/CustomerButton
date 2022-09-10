import 'package:custom_button_app/counted_button_screen.dart';
import 'package:custom_button_app/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenRoutes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (builder) => const HomeScreen());

      case CountedButtonScreen.routeName:
        var args = settings.arguments as CountedButtonScreen;
        return MaterialPageRoute(
          builder: (builder) => CountedButtonScreen(number: args.number),
        );
      default:
        return MaterialPageRoute(
          builder: (builder) => const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          ),
        );
    }
  }
}
