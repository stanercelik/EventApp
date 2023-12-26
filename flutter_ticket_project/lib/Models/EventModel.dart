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
  final double price;

  EventModel({
    required this.eventPhoto,
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
    required this.price,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      eventPhoto: json['eventPhoto'],
      eventName: json['eventName'],
      eventLocationName: json['eventLocationName'],
      startDay: json['startDay'],
      startMonth: json['startMonth'],
      startYear: json['startYear'],
      finishDay: json['finishDay'],
      finishMonth: json['finishMonth'],
      finishYear: json['finishYear'],
      eventTime: json['eventTime'],
      eventType: json['eventType'],
      price: json['price'].toDouble(),
    );
  }
}
