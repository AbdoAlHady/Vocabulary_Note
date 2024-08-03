import 'package:flutter/material.dart';
import 'package:vocabulary_note/core/routing/routes.dart';
import 'package:vocabulary_note/ui/screens/home_screen.dart';
import 'package:vocabulary_note/ui/screens/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
