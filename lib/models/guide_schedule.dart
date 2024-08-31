class GuideSchedule {
  final String scheduleId;
  final String guideId;
  final String scheduleDate;
  final String eventDate;
  final String description;

  GuideSchedule({
    required this.scheduleId,
    required this.guideId,
    required this.scheduleDate,
    required this.eventDate,
    required this.description,
  });

  factory GuideSchedule.fromMap(
      Map<String, dynamic> scheduleMap, String documentId) {
    return GuideSchedule(
      scheduleId: documentId,
      guideId: scheduleMap['guide_id'] ?? '',
      scheduleDate: scheduleMap['schedule_date'] ?? '',
      eventDate: scheduleMap['event_date'] ?? '',
      description: scheduleMap['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'guide_id': guideId,
      'schedule_date': scheduleDate,
      'event_date': eventDate,
      'description': description,
    };
  }
}
