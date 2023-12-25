import 'dart:ffi';

class EventModel {
  final String eventPhoto;
  final String eventName;
  final String eventLocationName;
  final String startDay;
  final String startMonth;
  final String startYear;
  final String finishDay;
  final String finishMonth;
  final String finishYear;
  final String eventTime;
  final String eventType;
  final int price;
  late String eventDescription;

  EventModel(
      {required this.eventPhoto,
      required this.eventName,
      required this.eventLocationName,
      required this.startDay,
      required this.startMonth,
      required this.startYear,
      required this.finishDay,
      required this.finishMonth,
      required this.finishYear,
      required this.eventTime,
      required this.eventType,
      required this.price});
}
