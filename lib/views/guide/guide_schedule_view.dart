import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/config/routes.dart';
import 'package:travel_guide/models/guide_schedule.dart';
import 'package:travel_guide/utils/schedule/schedule_data.dart';
import 'package:travel_guide/view_models/guide_schedule_view_model.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';
import 'package:travel_guide/widget/guide_schedule/schedule_container.dart';

class GuideScheduleView extends StatefulWidget {
  final String guideId;
  const GuideScheduleView({super.key, required this.guideId});

  @override
  State<GuideScheduleView> createState() => GuideScheduleViewState();
}

class GuideScheduleViewState extends State<GuideScheduleView> {
  final List<ScheduleData> scheduleContainers = [];

  @override
  void initState() {
    super.initState();
    addScheduleContainer();
  }

  void addScheduleContainer() {
    final TextEditingController detailController = TextEditingController();
    final TextEditingController dateController = TextEditingController();

    final container = ScheduleContainer(
      detailController: detailController,
      dateController: dateController,
    );

    setState(() {
      scheduleContainers.add(ScheduleData(
        detailController: detailController,
        dateController: dateController,
        container: container,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheduleViewModel = context.watch<GuideScheduleViewModel>();
    num scheduleDate = 1;
    return BaseImageContainer(
        imagePath: 'images/schedule_background.jpg',
        child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 150),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...scheduleContainers
                      .map((scheduleData) => scheduleData.container),
                  TextButton(
                      onPressed: addScheduleContainer,
                      child: const Text('スケジュールを追加')),
                  Container(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                          onPressed: () {
                            for (var scheduleContainer in scheduleContainers) {
                              GuideSchedule schedule = GuideSchedule(
                                  guideId: widget.guideId,
                                  scheduleDate: scheduleDate,
                                  eventDate: scheduleContainer
                                      .container.dateController!.text,
                                  description: scheduleContainer
                                      .container.detailController!.text);
                              scheduleViewModel.addSchedule(schedule);
                            }
                            Navigator.pushNamed(
                              context,
                              Routes.guideHome,
                              arguments: {
                                'isFirstPage': false,
                                'guideId': widget.guideId,
                              },
                            );
                          },
                          child: const Text('保存'))),
                ],
              ),
            )));
  }
}
