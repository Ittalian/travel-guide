import 'package:flutter/foundation.dart';
import 'package:travel_guide/models/guide_schedule.dart';
import 'package:travel_guide/repositories/guide_schedule_repository.dart';

class GuideScheduleViewModel extends ChangeNotifier {
  final GuideScheduleRepository guideScheduleRepository;

  List<GuideSchedule> _schedules = [];
  List<GuideSchedule> get schedules => _schedules;

  GuideScheduleViewModel(this.guideScheduleRepository);

  void fetchSchedules(String guideId) {
    guideScheduleRepository
        .getSchedulesByGuideId(guideId)
        .listen((scheduleList) {
      _schedules = scheduleList;
      notifyListeners();
    });
  }

  Future<void> addSchedule(GuideSchedule schedule) async {
    await guideScheduleRepository.addSchdule(schedule);
  }
}
