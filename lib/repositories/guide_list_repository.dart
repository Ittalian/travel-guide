import 'package:travel_guide/models/guide_list.dart';
import 'package:travel_guide/serivces/guide_list_service.dart';

class GuideListRepository {
  final GuideListService guideListService;

  GuideListRepository(this.guideListService);

  Stream<List<GuideList>> getLists() {
    return guideListService.getLists();
  }

  Future<void> addList(GuideList list) {
    return guideListService.addList(list);
  }
}
