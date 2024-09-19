import 'package:cloud_firestore/cloud_firestore.dart';

class GuideList {
  String? listId;
  String guideId;
  String? title;
  FieldValue? createdTime;

  GuideList({
    this.listId,
    required this.guideId,
    this.title,
    this.createdTime,
  });

  factory GuideList.fromMap(Map<String, dynamic> listMap, String documentId) {
    return GuideList(
      listId: documentId,
      guideId: listMap['guide_id'] ?? '',
      title: listMap['title'] ?? '',
      createdTime: listMap['created_time'] ?? FieldValue.serverTimestamp(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'guide_id': guideId,
      'title': title,
      'created_time': FieldValue.serverTimestamp(),
    };
  }
}
