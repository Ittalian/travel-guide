class Guide {
  final String guideId;
  final String scheduleId;
  final String listId;
  final String title;

  Guide({
    required this.guideId,
    required this.scheduleId,
    required this.listId,
    required this.title,
  });

  factory Guide.fromMap(Map<String, dynamic> guideMap, String documentId) {
    return Guide(
        guideId: documentId,
        scheduleId: guideMap['schedule_id'],
        listId: guideMap['list_id'],
        title: guideMap['title']);
  }

  Map<String, dynamic> toMap() {
    return {
      'guide_id': guideId,
      'schedule_id': scheduleId,
      'list_id': listId,
      'title': title,
    };
  }
}
