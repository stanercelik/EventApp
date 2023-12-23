import 'package:flutter_ticket_project/Models/EventModel.dart';

class TicketModel {
  final EventModel event;
  final String seatNum;
  final String qRCode;

  TicketModel({
    required this.event,
    required this.seatNum,
    required this.qRCode,
  });
}
