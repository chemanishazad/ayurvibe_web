import 'package:ayurvibe/screens/homeScreen/home_screen.dart';
import 'package:ayurvibe/screens/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashScreen(),
    '/home': (context) => const HomeScreen(),
  };
}
