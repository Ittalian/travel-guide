import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/config/routes.dart';
import 'package:travel_guide/view_models/guide_list_view_model.dart';
import 'package:travel_guide/view_models/guide_schedule_view_model.dart';
import 'package:travel_guide/views/browse/guide_schedule_browse.dart';
import 'package:travel_guide/views/guide/guide_list_view.dart';
import 'package:travel_guide/widget/base/base_button.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';

class GuideHomeView extends StatefulWidget {
  final bool isFirstPage;
  final String guideId;
  const GuideHomeView(
      {super.key, required this.isFirstPage, required this.guideId});

  @override
  GuideHomeViewState createState() => GuideHomeViewState();
}

class GuideHomeViewState extends State<GuideHomeView> {
  String imagePath = 'images/init_background.jpg';
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void moveSchedulePage() {
    Navigator.pushNamed(context, Routes.schedule, arguments: widget.guideId);
  }

  void moveListPage() {
    Navigator.pushNamed(context, Routes.list, arguments: widget.guideId);
  }

  void saveGuide() {}

  void navigateToFirstPage() {
    pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final guideScheduleViewModel = context.watch<GuideScheduleViewModel>();
    final guideListViewModel = context.watch<GuideListViewModel>();
    guideScheduleViewModel.fetchSchedules(widget.guideId);
    guideListViewModel.fetchLists(widget.guideId);
    return BaseImageContainer(
        imagePath: imagePath,
        child: Scaffold(
            backgroundColor: Colors.white.withOpacity(0),
            body: PageView(
              children: [
                Consumer<GuideScheduleViewModel>(
                  builder: (context, viewModel, child) {
                    if (viewModel.schedules.isEmpty) {
                      return const Center(
                          child: Text('No schedules available'));
                    }
                    return GuideScheduleBrowse(guideId: widget.guideId);
                  },
                ),
                Consumer<GuideListViewModel>(
                  builder: (context, viewModel, child) {
                    if (viewModel.lists.isEmpty) {
                      return const Center(
                          child: Text('No schedules available'));
                    }
                    return PageView.builder(
                      itemCount: viewModel.lists.length,
                      itemBuilder: (context, index) {
                        return GuideListView(guideId: widget.guideId);
                      },
                    );
                  },
                ),
                Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseButton(
                            buttonText: 'スケジュール', onPressed: moveSchedulePage),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        BaseButton(buttonText: 'リスト', onPressed: moveListPage),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        if (!widget.isFirstPage)
                          BaseButton(buttonText: '保存', onPressed: saveGuide)
                      ],
                    ))
              ],
            )));
  }
}
