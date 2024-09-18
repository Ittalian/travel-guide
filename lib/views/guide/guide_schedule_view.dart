import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/config/routes.dart';
import 'package:travel_guide/models/guide_schedule.dart';
import 'package:travel_guide/view_models/guide_schedule_view_model.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';
import 'package:travel_guide/widget/guide_schedule/schedule_container.dart';

class GuideScheduleView extends StatefulWidget {
  final String guideId;
  final String scheduleListId;
  const GuideScheduleView({
    super.key,
    required this.guideId,
    required this.scheduleListId,
  });

  @override
  State<GuideScheduleView> createState() => GuideScheduleViewState();
}

class GuideScheduleViewState extends State<GuideScheduleView> {
  final List<ScheduleContainer> scheduleContainers = [];

  @override
  void initState() {
    super.initState();
    final guideScheduleViewModel = context.read<GuideScheduleViewModel>();
    guideScheduleViewModel.fetchSchedules(widget.scheduleListId);
    getScheduleContainer(guideScheduleViewModel);
  }

  void getScheduleContainer(GuideScheduleViewModel guideScheduleViewModel) {
    setState(() {
      for (var schedule in guideScheduleViewModel.schedules) {
        scheduleContainers.add(ScheduleContainer(
          initDate: schedule.eventDate,
          initDetail: schedule.description,
        ));
      }
    });
  }

  void addScheduleContainer() {
    final TextEditingController detailController = TextEditingController();
    final TextEditingController dateController = TextEditingController();

    final container = ScheduleContainer(
      detailController: detailController,
      dateController: dateController,
    );
    setState(() {
      scheduleContainers.add(container);
    });
  }

  @override
  Widget build(BuildContext context) {
    final guideScheduleViewModel = context.read<GuideScheduleViewModel>();
    return BaseImageContainer(
        imagePath: 'images/schedule_background.jpg',
        child: PageView(children: [
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 150),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...scheduleContainers,
                    TextButton(
                        onPressed: addScheduleContainer,
                        child: const Text('スケジュールを追加')),
                    Container(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                            onPressed: () async {
                              for (var scheduleContainer
                                  in scheduleContainers) {
                                if (scheduleContainer.dateController != null &&
                                    scheduleContainer.detailController !=
                                        null) {
                                  GuideSchedule schedule = GuideSchedule(
                                      scheduleListId: widget.scheduleListId,
                                      eventDate: scheduleContainer
                                          .dateController!.text,
                                      description: scheduleContainer
                                          .detailController!.text);
                                  await guideScheduleViewModel
                                      .addSchedule(schedule);
                                }
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
              ))
        ]));
  }
}
