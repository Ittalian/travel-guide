import 'package:travel_guide/models/guide_list_item.dart';
import 'package:travel_guide/serivces/guide_list_item_service.dart';

class GuideListItemRepository {
  final GuideListItemService guideListItemService;

  GuideListItemRepository(this.guideListItemService);

  Stream<List<GuideListItem>> getListitems() {
    return guideListItemService.getListItems();
  }

  Future<void> addListItem(GuideListItem item) {
    return guideListItemService.addGuideListItem(item);
  }

  deleteListItem(String listItemId) {
    guideListItemService.deleteListItem(listItemId);
  }
}
