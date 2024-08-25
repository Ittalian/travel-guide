import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_guide/models/guide_list.dart';

class GuideListService {
  final db = FirebaseFirestore.instance.collection('List');

  Stream<List<GuideList>> getLists() {
    return db.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => GuideList.fromMap(doc.data(), doc.id))
        .toList());
  }

  Future<void> addList(GuideList list) {
    return db.add(list.toMap());
  }
}
