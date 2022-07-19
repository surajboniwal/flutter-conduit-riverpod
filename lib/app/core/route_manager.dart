import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/auth_screen.dart';

class RouteManager {
  static String? currentRoute;
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    currentRoute = settings.name;
    Widget child = Container();

    switch (settings.name) {
      case AuthScreen.route:
        child = const AuthScreen();
        break;
    }

    return MaterialPageRoute(builder: (context) => child);
  }
}
