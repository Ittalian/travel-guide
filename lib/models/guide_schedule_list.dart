class GuideScheduleList {
  final String? scheduleListId;
  final String guideId;
  final String? title;

  GuideScheduleList({
    this.scheduleListId,
    required this.guideId,
    this.title,
  });

  factory GuideScheduleList.fromMap(
      Map<String, dynamic> scheduleListMap, String documentId) {
    return GuideScheduleList(
        scheduleListId: documentId,
        guideId: scheduleListMap['guide_id'] ?? '',
        title: scheduleListMap['title'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'guide_id': guideId,
      'title': title,
    };
  }
}
