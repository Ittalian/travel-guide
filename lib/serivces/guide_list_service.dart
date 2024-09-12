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
    return db.add(list.toMap()).then((ref) => ref.id);
  }

  Stream<List<GuideList>> getListsByGuideId(String guideId) {
    return db.where('guide_id', isEqualTo: guideId).snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => GuideList.fromMap(doc.data(), doc.id))
            .toList());
  }

  deleteList(String guideId) async {
    QuerySnapshot snapshot =
        await db.where('guide_id', isEqualTo: guideId).get();
    for (var doc in snapshot.docs) {
      doc.reference.delete();
    }
  }
}
