import 'package:flutter/material.dart';
import 'package:travel_guide/views/guide/guide_init_view.dart';
import 'package:travel_guide/views/guide/guide_schedule_view.dart';

class GuideHomeView extends StatefulWidget {
  final bool isFirstPage;
  const GuideHomeView({super.key, required this.isFirstPage});

  @override
  GuideHomeViewState createState() => GuideHomeViewState();
}

class GuideHomeViewState extends State<GuideHomeView> {
  late PageController pageController;
  List<Widget> pages = [];
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    pages.add(buildHomePage());
    addSchedulePage();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget buildHomePage() {
    return GuideInitView(
        isFirstPage: true,
        addSchedulePage: () {
          addSchedulePage();
          navigateToFirstPage();
        });
  }

  void addSchedulePage() {
    setState(() {
      pages.insert(0, const GuideScheduleView());
    });
  }

  // void _addListPage() {
  //   setState(() {
  //     pages.add(const GuideListView());
  //     navigateToFirstPage();
  //   });
  // }

  void navigateToFirstPage() {
    pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: pages,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }
}
