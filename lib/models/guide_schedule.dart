class GuideSchedule {
  final DateTime scheduleDate;
  final DateTime eventDate;
  final String description;
  final String? backgroundUrl;

  GuideSchedule({
    required this.scheduleDate,
    required this.eventDate,
    required this.description,
    this.backgroundUrl,
  });

  factory GuideSchedule.fromMap(
      Map<String, dynamic> scheduleMap, String documentId) {
    return GuideSchedule(
      scheduleDate: scheduleMap['schedule_date'] as DateTime,
      eventDate: scheduleMap['event_date'] as DateTime,
      description: scheduleMap['description'],
      backgroundUrl: scheduleMap['background_url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'schedule_date': scheduleDate,
      'event_date': eventDate,
      'description': description,
      'background_url': backgroundUrl,
    };
  }
}
