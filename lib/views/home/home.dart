import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/config/routes.dart';
import 'package:travel_guide/view_models/guide_list_view_model.dart';
import 'package:travel_guide/view_models/guide_schedule_view_model.dart';
import 'package:travel_guide/view_models/guide_view_model.dart';
import 'package:travel_guide/widget/base/base_button.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void browseGuide(String guideId) {
    Navigator.pushNamed(context, Routes.browse, arguments: guideId);
  }

  @override
  Widget build(BuildContext context) {
    final guideViewModel = context.watch<GuideViewModel>();
    final guideScheduleViewModel = context.watch<GuideScheduleViewModel>();
    final guideListViewModel = context.watch<GuideListViewModel>();
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
                    onTap: () => browseGuide(guide.guideId!),
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
                              BaseButton(buttonText: '共有', onPressed: () {}),
                              const Padding(padding: EdgeInsets.only(left: 5)),
                              BaseButton(
                                  buttonText: '削除',
                                  onPressed: () async {
                                    await guideListViewModel
                                        .deleteList(guide.guideId!);
                                    await guideScheduleViewModel
                                        .deleteSchedule(guide.guideId!);
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
