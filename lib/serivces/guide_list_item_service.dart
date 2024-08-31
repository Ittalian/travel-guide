import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_guide/models/guide_list_item.dart';

class GuideListItemService {
  final db = FirebaseFirestore.instance.collection('ListItem');

  Stream<List<GuideListItem>> getListItems() {
    return db.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => GuideListItem.fromMap(doc.data(), doc.id))
        .toList());
  }

  Future<void> addGuideListItem(GuideListItem item) {
    return db.add(item.toMap());
  }
}
