import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/config/routes.dart';
import 'package:travel_guide/models/guide_list.dart';
import 'package:travel_guide/models/guide_schedule_list.dart';
import 'package:travel_guide/view_models/guide_list_view_model.dart';
import 'package:travel_guide/view_models/guide_schedule_list_view_model.dart';
import 'package:travel_guide/view_models/guide_view_model.dart';
import 'package:travel_guide/views/guide/guide_list_view.dart';
import 'package:travel_guide/views/guide/guide_schedule_view.dart';
import 'package:travel_guide/widget/base/base_button.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = [];
  Future<List<Widget>> getPageViews(
      GuideScheduleListViewModel guidescheduleListViewModel,
      GuideListViewModel guideListViewModel,
      String guideId) async {
    await getGuidePages(
        guidescheduleListViewModel, guideListViewModel, guideId);
    await getInitPage(guidescheduleListViewModel, guideListViewModel, guideId);

    return pages;
  }

  Future<void> getGuidePages(GuideScheduleListViewModel scheduleListVewModel,
      GuideListViewModel listViewModel, guideId) async {
    setState(() {
      for (var scheduleList in scheduleListVewModel.scheduleLists) {
        pages.add(GuideScheduleView(
            guideId: guideId, scheduleListId: scheduleList.scheduleListId!));
      }
      for (var list in listViewModel.lists) {
        pages.add(GuideListItemView(guideId: guideId, listId: list.listId!));
      }
    });
  }

  Future<void> getInitPage(GuideScheduleListViewModel scheduleListVewModel,
      GuideListViewModel listViewModel, String guideId) async {
    setState(() {
      pages.add(Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BaseButton(
                  buttonText: 'スケジュール',
                  onPressed: () async {
                    String scheduleListId = await scheduleListVewModel
                        .addScheduleList(GuideScheduleList(guideId: guideId));
                    moveSchedulePage(guideId, scheduleListId);
                  }),
              const Padding(padding: EdgeInsets.only(top: 10)),
              BaseButton(
                  buttonText: 'リスト',
                  onPressed: () async {
                    String listId = await listViewModel
                        .addList(GuideList(guideId: guideId));
                    moveListPage(guideId, listId);
                  }),
              const Padding(padding: EdgeInsets.only(top: 10)),
              BaseButton(buttonText: '保存', onPressed: moveHomePage)
            ],
          )));
    });
  }

  void moveSchedulePage(String guideId, String scheduleListId) {
    Navigator.pushNamed(context, Routes.schedule, arguments: {
      'guideId': guideId,
      'scheduleListId': scheduleListId,
    });
  }

  void moveListPage(String guideId, String listId) {
    Navigator.pushNamed(context, Routes.list, arguments: {
      'guideId': guideId,
      'listId': listId,
    });
  }

  void moveHomePage() {
    Navigator.pushNamed(context, Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    final guideViewModel = context.watch<GuideViewModel>();
    return BaseImageContainer(
        imagePath: 'images/home_background.jpg',
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0),
          body: SingleChildScrollView(
              child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 200)),
              for (var guide in guideViewModel.guides)
                GestureDetector(
                    onTap: () async {
                      await Navigator.pushNamed(context, Routes.browse,
                          arguments: guide.guideId);
                    },
                    child: Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(10),
                      color: Colors.white.withOpacity(0.8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              guide.title,
                              style: const TextStyle(fontSize: 20),
                            ),
                            Row(children: [
                              BaseButton(
                                  buttonText: '編集',
                                  onPressed: () async {
                                    final guideScheduleViewModel = context
                                        .read<GuideScheduleListViewModel>();
                                    final guideListViewModel =
                                        context.read<GuideListViewModel>();
                                    await guideScheduleViewModel
                                        .fetchScheduleLists(guide.guideId!);
                                    await guideListViewModel
                                        .fetchLists(guide.guideId!);
                                    await getPageViews(guideScheduleViewModel,
                                        guideListViewModel, guide.guideId!);
                                    Navigator.pushNamed(
                                        context, Routes.guideHome,
                                        arguments: {
                                          'isFirstPage': false,
                                          'guideId': guide.guideId,
                                          'pages': pages,
                                        });
                                  }),
                              const Padding(padding: EdgeInsets.only(left: 5)),
                              BaseButton(
                                  buttonText: '削除',
                                  onPressed: () async {
                                    await guideViewModel
                                        .deleteGuide(guide.guideId!);
                                  })
                            ])
                          ]),
                    )),
            ],
          )),
          floatingActionButton: FloatingActionButton(
              tooltip: 'しおりを追加',
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, Routes.createTitle);
              }),
        ));
  }
}
