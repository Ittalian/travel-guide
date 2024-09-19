import 'package:cloud_firestore/cloud_firestore.dart';

class GuideScheduleList {
  final String? scheduleListId;
  final String guideId;
  final String? title;
  final FieldValue? createdTime;

  GuideScheduleList({
    this.scheduleListId,
    required this.guideId,
    this.title,
    this.createdTime,
  });

  factory GuideScheduleList.fromMap(
      Map<String, dynamic> scheduleListMap, String documentId) {
    return GuideScheduleList(
        scheduleListId: documentId,
        guideId: scheduleListMap['guide_id'] ?? '',
        title: scheduleListMap['title'] ?? '',
        createdTime: scheduleListMap['created_time'] ?? FieldValue.serverTimestamp());
  }

  Map<String, dynamic> toMap() {
    return {
      'guide_id': guideId,
      'title': title,
      'created_time': FieldValue.serverTimestamp(),
    };
  }
}
