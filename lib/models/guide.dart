class Guide {
  final String guideId;
  final String title;

  Guide({
    required this.guideId,
    required this.title,
  });

  factory Guide.fromMap(Map<String, dynamic> guideMap, String documentId) {
    return Guide(
        guideId: documentId,
        title: guideMap['title']);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }
}
