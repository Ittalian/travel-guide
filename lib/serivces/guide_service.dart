import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_guide/models/guide.dart';

class GuideService {
  final CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection('Guide');

  Stream<List<Guide>> getGuides() {
    return db.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Guide.fromMap(doc.data(), doc.id)).toList());
  }

  Future<void> addGuide(Guide guide) {
    return db.add(guide.toMap());
  }
}
