import 'package:flutter/material.dart';
import 'package:travel_guide/widget/guide_schedule/schedule_container.dart';

class ScheduleData {
  final TextEditingController detailController;
  final TextEditingController dateController;
  final ScheduleContainer container;

  ScheduleData({
    required this.detailController,
    required this.dateController,
    required this.container,
  });
}
