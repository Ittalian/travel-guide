import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_guide/models/guide.dart';

class GuideService {
  final CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection('Guide');
  final CollectionReference<Map<String, dynamic>> scheduleListDb =
      FirebaseFirestore.instance.collection('ScheduleList');
  final CollectionReference<Map<String, dynamic>> scheduleDb =
      FirebaseFirestore.instance.collection('Schedule');
  final CollectionReference<Map<String, dynamic>> listDb =
      FirebaseFirestore.instance.collection('List');
  final CollectionReference<Map<String, dynamic>> listItemDb =
      FirebaseFirestore.instance.collection('ListItem');

  Stream<List<Guide>> getGuides() {
    return db.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Guide.fromMap(doc.data(), doc.id)).toList());
  }

  Future<String> addGuide(Guide guide) async {
    DocumentReference ref = await db.add(guide.toMap());
    return ref.id;
  }

  deleteGuide(String guideId) async {
    try {
      await db.doc(guideId).delete();
      QuerySnapshot scheduleListSnapshots =
          await scheduleListDb.where('guide_id', isEqualTo: guideId).get();
      List<String> scheuleListIds =
          await _deleteSnapShots(scheduleListSnapshots);
      for (var scheduleListId in scheuleListIds) {
        QuerySnapshot scheduleSnapshot = await scheduleDb
            .where('schedule_list_id', isEqualTo: scheduleListId)
            .get();
        _deleteSnapShots(scheduleSnapshot);
      }
      QuerySnapshot listSnapshots =
          await listDb.where('guide_id', isEqualTo: guideId).get();
      List<String> listIds = await _deleteSnapShots(listSnapshots);
      for (var listId in listIds) {
        QuerySnapshot listSnapshots =
            await listItemDb.where('list_id', isEqualTo: listId).get();
        _deleteSnapShots(listSnapshots);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<String>> _deleteSnapShots(QuerySnapshot snapshots) async {
    List<String> documentIds = [];
    for (var doc in snapshots.docs) {
      documentIds.add(doc.id);
      await doc.reference.delete();
    }

    return documentIds;
  }
}
