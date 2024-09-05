class GuideList {
  String? listId;
  String guideId;
  String title;
  String description;

  GuideList({
    this.listId,
    required this.guideId,
    required this.title,
    required this.description,
  });

  factory GuideList.fromMap(Map<String, dynamic> listMap, String documentId) {
    return GuideList(
      listId: documentId,
      guideId: listMap['guide_id'] ?? '',
      title: listMap['title'] ?? '',
      description: listMap['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'guide_id': guideId,
      'title': title,
      'description': description,
    };
  }
}
