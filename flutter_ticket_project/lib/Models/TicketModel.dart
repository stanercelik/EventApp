import 'package:flutter_ticket_project/Models/EventModel.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketModel {
  final EventModel event;
  final List<String> seatNums;
  final QrImageView? qRCode;

  TicketModel({
    required this.event,
    required this.seatNums,
    this.qRCode,
  });
}
