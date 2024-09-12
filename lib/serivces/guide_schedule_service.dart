import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_guide/models/guide_schedule.dart';

class GuideScheduleService {
  final db = FirebaseFirestore.instance.collection('Schedule');

  Stream<List<GuideSchedule>> getSchedules() {
    return db.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => GuideSchedule.fromMap(doc.data(), doc.id))
        .toList());
  }

  Future<void> addSchedule(GuideSchedule schedule) {
    return db.add(schedule.toMap()).then((ref) => ref.id);
  }

  Stream<List<GuideSchedule>> getSchedulesByGuideId(String guideId) {
    return db.where('guide_id', isEqualTo: guideId).snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => GuideSchedule.fromMap(doc.data(), doc.id))
            .toList());
  }

  deleteSchedule(String guideId) async {
    QuerySnapshot snapshot =
        await db.where('guide_id', isEqualTo: guideId).get();
    for (var doc in snapshot.docs) {
      doc.reference.delete();
    }
  }
}
