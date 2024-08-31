class GuideList {
  String listId;
  String title;
  String guideId;

  GuideList({
    required this.listId,
    required this.title,
    required this.guideId,
  });

  factory GuideList.fromMap(Map<String, dynamic> listMap, String documentId) {
    return GuideList(
      listId: documentId,
      title: listMap['title'] ?? '',
      guideId: listMap['guide_id'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'guide_id': guideId,
    };
  }
}
