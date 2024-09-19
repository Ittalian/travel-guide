import 'package:flutter/foundation.dart';
import 'package:travel_guide/models/guide_schedule_list.dart';
import 'package:travel_guide/repositories/guide_schedule_list_repository.dart';

class GuideScheduleListViewModel extends ChangeNotifier {
  final GuideScheduleListRepository guideScheduleListRepository;

  List<GuideScheduleList> _scheduleLists = [];
  List<GuideScheduleList> get scheduleLists => _scheduleLists;

  GuideScheduleListViewModel(this.guideScheduleListRepository);

  Future<void> fetchScheduleLists(String guideId) async {
    guideScheduleListRepository
        .getScheduleListByGuideId(guideId)
        .listen((listSchedules) {
      _scheduleLists = listSchedules;
      notifyListeners();
    });
  }

  Future<String> addScheduleList(GuideScheduleList scheduleList) async {
    return await guideScheduleListRepository.addScheduleList(scheduleList);
  }
}
