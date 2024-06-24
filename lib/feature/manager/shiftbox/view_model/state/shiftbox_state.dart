// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/model/event_model.dart';

class ShiftBoxState extends Equatable {
  const ShiftBoxState({
    required this.selectedMonth,
    this.eventList,
    this.selectedEvent,
  });

  final DateTime selectedMonth;
  final List<EventModel>? eventList;
  final EventModel? selectedEvent;
  @override
  List<Object?> get props => [
        selectedMonth,
        eventList,
        selectedEvent,
      ];

  ShiftBoxState copyWith({
    DateTime? selectedMonth,
    List<EventModel>? eventList,
    EventModel? selectedEvent,
  }) {
    return ShiftBoxState(
      selectedMonth: selectedMonth ?? this.selectedMonth,
      eventList: eventList ?? this.eventList,
      selectedEvent: selectedEvent ?? this.selectedEvent,
    );
  }
}
