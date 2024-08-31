import 'package:flutter/material.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';
import 'package:travel_guide/widget/guide_schedule/schedule_container.dart';

class GuideScheduleView extends StatelessWidget {
  const GuideScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController detailController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    return BaseImageContainer(
        imagePath: 'images/schedule_background.jpg',
        child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScheduleContainer(detailController: detailController, dateController: dateController),
                ],
              ),
            )));
  }
}
