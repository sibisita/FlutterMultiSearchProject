import 'package:flutter/material.dart';
import 'package:multi_search/main.dart';
import 'package:multi_search/views/progress.dart';

import 'Views/about.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case "/about":
        return MaterialPageRoute(builder: (_) => AboutPage());
      case "/progress":
        return MaterialPageRoute(builder: (_) => ProgressPage());
      default:
        return MaterialPageRoute(builder: (_) => MyHomePage());
    }
  }
}
