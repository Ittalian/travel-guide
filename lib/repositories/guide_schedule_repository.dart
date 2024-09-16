import 'package:travel_guide/models/guide_schedule.dart';
import 'package:travel_guide/serivces/guide_schedule_service.dart';

class GuideScheduleRepository {
  final GuideScheduleService guideScheduleService;

  GuideScheduleRepository(this.guideScheduleService);

  Stream<List<GuideSchedule>> getSchedule() {
    return guideScheduleService.getSchedules();
  }

  Future<void> addSchdule(GuideSchedule schedule) {
    return guideScheduleService.addSchedule(schedule);
  }

  Stream<List<GuideSchedule>> getSchedulesByGuideId(String scheduleListId) {
    return guideScheduleService.getSchedulesByScheduleListId(scheduleListId);
  }
}
