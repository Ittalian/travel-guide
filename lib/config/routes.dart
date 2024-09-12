import 'package:flutter/material.dart';
import 'package:travel_guide/views/guide/create_title_view.dart';
import 'package:travel_guide/views/guide/guide_home_view.dart';
import 'package:travel_guide/views/guide/guide_list_view.dart';
import 'package:travel_guide/views/guide/guide_schedule_view.dart';
import 'package:travel_guide/views/home/home.dart';

class Routes {
  static const String home = '/';
  static const String createTitle = '/create_title';
  static const String guideHome = '/guide_home';
  static const String schedule = '/schedule';
  static const String list = '/list';
  static const String browse = '/browse';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const Home());
      case createTitle:
        return MaterialPageRoute(builder: (_) => const CreateTitleView());
      case guideHome:
        final guideOption = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => GuideHomeView(
                  isFirstPage: guideOption['isFirstPage'] as bool,
                  guideId: guideOption['guideId'] as String,
                  isBrowseMode: false,
                ));
      case schedule:
        final guideId = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => GuideScheduleView(guideId: guideId));
      case list:
        final guideId = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => GuideListView(guideId: guideId));
      case browse:
        final guideId = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => GuideHomeView(
                  guideId: guideId,
                  isFirstPage: false,
                  isBrowseMode: true,
                ));
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
