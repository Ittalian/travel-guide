import 'package:flutter/material.dart';
import 'package:travel_guide/utils/schedule/schedule_data.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';
import 'package:travel_guide/widget/guide_schedule/schedule_container.dart';

class GuideScheduleView extends StatefulWidget {
  const GuideScheduleView({super.key});

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
    return BaseImageContainer(
        imagePath: 'images/schedule_background.jpg',
        child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 150),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...scheduleContainers.map((scheduleData) => scheduleData.container),
                  TextButton(
                      onPressed: addScheduleContainer,
                      child: const Text('スケジュールを追加')),
                ],
              ),
            )));
  }
}
