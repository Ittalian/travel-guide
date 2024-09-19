import 'package:flutter/foundation.dart';
import 'package:travel_guide/models/guide_list.dart';
import 'package:travel_guide/repositories/guide_list_repository.dart';

class GuideListViewModel extends ChangeNotifier {
  final GuideListRepository guideListRepository;

  List<GuideList> _lists = [];
  List<GuideList> get lists => _lists;

  GuideListViewModel(this.guideListRepository);

  Future<void> fetchLists(String guideId) async {
    guideListRepository.getSchedulesByGuideId(guideId).listen((listList) {
      _lists = listList;
      notifyListeners();
    });
  }

  Future<String> addList(GuideList list) async {
    return await guideListRepository.addList(list);
  }
}
