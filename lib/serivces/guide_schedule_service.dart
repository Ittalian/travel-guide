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

  Stream<List<GuideSchedule>> getSchedulesByScheduleListId(String scheduleListId) {
    return db.where('schedule_list_id', isEqualTo: scheduleListId).snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => GuideSchedule.fromMap(doc.data(), doc.id))
            .toList());
  }
}
