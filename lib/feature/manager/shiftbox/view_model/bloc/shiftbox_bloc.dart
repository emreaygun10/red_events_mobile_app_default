import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/model/event_model.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/state/shiftbox_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class ShiftBoxBloc extends BaseCubit<ShiftBoxState> {
  ShiftBoxBloc()
      : super(
          ShiftBoxState(
            selectedMonth: DateTime.now(),
            eventList: [
              EventModel(
                eventDate: DateTime.now(),
                eventName: 'Doğum Günü',
                eventClock: '07:00',
                eventPlace: 'Manzara Restaurant',
              ),
              EventModel(
                eventDate: DateTime.now(),
                eventName: 'Doğum Günü',
                eventClock: '07:00',
                eventPlace: 'Manzara Restaurant',
              ),
              EventModel(
                eventDate: DateTime.now(),
                eventName: 'Doğum Günü',
                eventClock: '07:00',
                eventPlace: 'Manzara Restaurant',
              ),
              EventModel(
                eventDate: DateTime.now(),
                eventName: 'Doğum Günü',
                eventClock: '07:00',
                eventPlace: 'Manzara Restaurant',
              ),
              EventModel(
                eventDate: DateTime.now(),
                eventName: 'Doğum Günü',
                eventClock: '07:00',
                eventPlace: 'Manzara Restaurant',
              ),
            ],
          ),
        );

  /// For change selected date
  void changeMonth(DateTime date) {
    emit(state.copyWith(selectedMonth: date));
  }

  void changeEventList(List<EventModel> eventList) {
    emit(state.copyWith(eventList: eventList));
  }

  void changeSelectedEvent(EventModel selectedEvent) {
    emit(state.copyWith(selectedEvent: selectedEvent));
  }
}
