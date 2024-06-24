// ignore_for_file: public_member_api_docs, sort_constructors_first
class EventModel {
  EventModel({
    required this.eventDate,
    required this.eventName,
    required this.eventClock,
    required this.eventPlace,
  });

  final DateTime eventDate;
  final String eventName;
  final String eventClock;
  final String eventPlace;

  EventModel copyWith({
    DateTime? eventDate,
    String? eventName,
    String? eventClock,
    String? eventPlace,
  }) {
    return EventModel(
      eventDate: eventDate ?? this.eventDate,
      eventName: eventName ?? this.eventName,
      eventClock: eventClock ?? this.eventClock,
      eventPlace: eventPlace ?? this.eventPlace,
    );
  }
}
