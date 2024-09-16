import 'package:travel_guide/models/guide_schedule_list.dart';
import 'package:travel_guide/serivces/guide_schedule_list_service.dart';

class GuideScheduleListRepository {
  final GuideScheduleListService guideScheduleListService;

  GuideScheduleListRepository(this.guideScheduleListService);

  Stream<List<GuideScheduleList>> getScheduleListByGuideId(String guideId) {
    return guideScheduleListService.getScheduleListByGuideId(guideId);
  }

  Future<String> addScheduleList(GuideScheduleList scheduleList) {
    return guideScheduleListService.addScheduleList(scheduleList);
  }
}
