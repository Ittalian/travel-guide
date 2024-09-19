import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/config/routes.dart';
import 'package:travel_guide/models/guide_list.dart';
import 'package:travel_guide/models/guide_schedule_list.dart';
import 'package:travel_guide/view_models/guide_list_view_model.dart';
import 'package:travel_guide/view_models/guide_schedule_list_view_model.dart';
import 'package:travel_guide/views/browse/guide_list_browse.dart';
import 'package:travel_guide/views/browse/guide_schedule_browse.dart';
import 'package:travel_guide/views/guide/guide_schedule_view.dart';
import 'package:travel_guide/views/guide/guide_list_view.dart';
import 'package:travel_guide/widget/base/base_button.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';

class GuideHomeView extends StatefulWidget {
  final bool isFirstPage;
  final bool isBrowseMode;
  final String guideId;
  final List<Widget>? pages;
  const GuideHomeView({
    super.key,
    required this.isFirstPage,
    required this.isBrowseMode,
    required this.guideId,
    this.pages,
  });

  @override
  GuideHomeViewState createState() => GuideHomeViewState();
}

class GuideHomeViewState extends State<GuideHomeView> {
  String imagePath = 'images/init_background.jpg';
  List<Widget> pages = [];
  // bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializedata();
    });
  }

  Future<void> initializedata() async {
    setState(() {
      pages = widget.pages!;
    });
    //   final guideScheduleListViewModel =
    //       context.read<GuideScheduleListViewModel>();
    //   final guideListViewModel = context.read<GuideListViewModel>();
    //   await guideScheduleListViewModel.fetchScheduleLists(widget.guideId);
    //   await guideListViewModel.fetchLists(widget.guideId);

    //   setState(() {
    //     getGuidePages(guideScheduleListViewModel, guideListViewModel);
    //     if (!widget.isBrowseMode) {
    //       getInitPage(guideScheduleListViewModel, guideListViewModel);
    //     }
    //     isInitialized = true;
    //   });
  }

  void moveSchedulePage(String scheduleListId) {
    Navigator.pushNamed(context, Routes.schedule, arguments: {
      'guideId': widget.guideId,
      'scheduleListId': scheduleListId,
    });
  }

  void moveListPage(String listId) {
    Navigator.pushNamed(context, Routes.list, arguments: {
      'guideId': widget.guideId,
      'listId': listId,
    });
  }

  void moveHomePage() {
    Navigator.pushNamed(context, Routes.home);
  }

  // void getGuidePages(GuideScheduleListViewModel scheduleListVewModel,
  //     GuideListViewModel listViewModel) {
  //   pages.clear();
  //   for (var scheduleList in scheduleListVewModel.scheduleLists) {
  //     if (widget.isBrowseMode) {
  //       pages.add(
  //           GuideScheduleBrowse(scheduleListId: scheduleList.scheduleListId!));
  //     } else {
  //       pages.add(GuideScheduleView(
  //           guideId: widget.guideId,
  //           scheduleListId: scheduleList.scheduleListId!));
  //     }
  //   }
  //   for (var list in listViewModel.lists) {
  //     if (widget.isBrowseMode) {
  //       pages.add(GuideListBrowse(listId: list.listId!));
  //     } else {
  //       pages.add(
  //           GuideListItemView(guideId: widget.guideId, listId: list.listId!));
  //     }
  //   }
  // }

  // void getInitPage(GuideScheduleListViewModel scheduleListVewModel,
  //     GuideListViewModel listViewModel) {
  //   pages.add(Container(
  //       alignment: Alignment.center,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           BaseButton(
  //               buttonText: 'スケジュール',
  //               onPressed: () async {
  //                 String scheduleListId =
  //                     await scheduleListVewModel.addScheduleList(
  //                         GuideScheduleList(guideId: widget.guideId));
  //                 moveSchedulePage(scheduleListId);
  //               }),
  //           const Padding(padding: EdgeInsets.only(top: 10)),
  //           BaseButton(
  //               buttonText: 'リスト',
  //               onPressed: () async {
  //                 String listId = await listViewModel
  //                     .addList(GuideList(guideId: widget.guideId));
  //                 moveListPage(listId);
  //               }),
  //           const Padding(padding: EdgeInsets.only(top: 10)),
  //           if (!widget.isFirstPage)
  //             BaseButton(buttonText: '保存', onPressed: moveHomePage)
  //         ],
  //       )));
  // }

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
        imagePath: imagePath,
        child: Scaffold(
            backgroundColor: Colors.white.withOpacity(0),
            body: PageView(children: pages)));
  }
}
