import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/view_models/guide_schedule_view_model.dart';
import 'package:travel_guide/widget/base/base_image_container.dart';
import 'package:travel_guide/widget/guide_schedule/schedule_container.dart';

class GuideScheduleBrowse extends StatelessWidget {
  final String guideId;
  const GuideScheduleBrowse({super.key, required this.guideId});

  @override
  Widget build(BuildContext context) {
    final guideScheduleViewModel = context.watch<GuideScheduleViewModel>();
    guideScheduleViewModel.fetchSchedules(guideId);
    return BaseImageContainer(
        imagePath: 'images/schedule_background.jpg',
        child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child: Column(
                    children: [
                  for (var schedule in guideScheduleViewModel.schedules) ...{
                    ScheduleContainer(
                      initDetail: schedule.description,
                      initDate: schedule.eventDate,
                    )
                  }
                ]))));
  }
}
