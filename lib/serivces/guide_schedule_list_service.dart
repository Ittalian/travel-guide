import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_guide/models/guide_schedule_list.dart';

class GuideScheduleListService {
  final db = FirebaseFirestore.instance.collection('ScheduleList');

  Stream<List<GuideScheduleList>> getScheduleListByGuideId(String guideId) {
    return db.where('guide_id', isEqualTo: guideId).orderBy('created_time', descending: false).snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => GuideScheduleList.fromMap(doc.data(), doc.id))
            .toList());
  }

  Future<String> addScheduleList(GuideScheduleList scheduleList) async {
    DocumentReference ref = await db.add(scheduleList.toMap());
    return ref.id;
  }
}
