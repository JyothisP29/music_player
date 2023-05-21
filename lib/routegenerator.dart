import 'package:audio/screens/home_screen.dart';
import 'package:audio/screens/splash_screens.dart';
import 'package:flutter/material.dart';

import 'helpers/screen_navigator.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/HomeScreen':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
   case '/Screens':
        return MaterialPageRoute(builder: (_) =>  Screens());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(body: SizedBox(height: 0)));
    }
  }
}
