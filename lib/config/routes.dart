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
                  pages: guideOption['pages'] as List<Widget>
                ));
      case schedule:
        final scheduleOption = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => GuideScheduleView(
                guideId: scheduleOption['guideId'] as String,
                scheduleListId: scheduleOption['scheduleListId'] as String));
      case list:
        final listOptions = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => GuideListItemView(
                guideId: listOptions['guideId'] as String,
                listId: listOptions['listId'] as String));
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
