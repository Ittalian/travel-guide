import 'package:flutter/material.dart';
import 'package:travel_guide/views/home/home.dart';

class Routes {
  static const String home = '/';
  static const String create = '/create';
  static const String schedule = '/schedule';
  static const String list = 'list';
  static const String init = 'init';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const Home());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text(
                    '${settings.name}は存在しません',
                    style: const TextStyle(fontSize: 20),
                  )),
                ));
    }
  }
}
