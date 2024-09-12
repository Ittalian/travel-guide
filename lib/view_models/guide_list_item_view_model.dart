import 'package:flutter/material.dart';
import 'package:travel_guide/models/guide_list_item.dart';
import 'package:travel_guide/repositories/guide_list_item_repository.dart';

class GuideListItemViewModel extends ChangeNotifier {
  final GuideListItemRepository guideListItemRepository;

  List<GuideListItem> _listItems = [];
  List<GuideListItem> get listItems => _listItems;

  GuideListItemViewModel(this.guideListItemRepository) {
    fetchGuideListItems();
  }

  void fetchGuideListItems() {
    guideListItemRepository.getListitems().listen((itemList) {
      _listItems = itemList;
      notifyListeners();
    });
  }

  Future<void> addListItem(GuideListItem item) async {
    await guideListItemRepository.addListItem(item);
  }

  deleteListItem(String listItemId) async {
    await guideListItemRepository.deleteListItem(listItemId);
  }
}
