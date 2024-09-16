class GuideList {
  String? listId;
  String guideId;
  String? title;

  GuideList({
    this.listId,
    required this.guideId,
    this.title,
  });

  factory GuideList.fromMap(Map<String, dynamic> listMap, String documentId) {
    return GuideList(
      listId: documentId,
      guideId: listMap['guide_id'] ?? '',
      title: listMap['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'guide_id': guideId,
      'title': title,
    };
  }
}
