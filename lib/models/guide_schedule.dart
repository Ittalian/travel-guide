class GuideSchedule {
  final String? scheduleId;
  final String scheduleListId;
  final String eventDate;
  final String description;

  GuideSchedule({
    this.scheduleId,
    required this.scheduleListId,
    required this.eventDate,
    required this.description,
  });

  factory GuideSchedule.fromMap(
      Map<String, dynamic> scheduleMap, String documentId) {
    return GuideSchedule(
      scheduleId: documentId,
      scheduleListId: scheduleMap['schedule_list_id'] ?? '',
      eventDate: scheduleMap['event_date'] ?? '',
      description: scheduleMap['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'schedule_list_id': scheduleListId,
      'event_date': eventDate,
      'description': description,
    };
  }
}
