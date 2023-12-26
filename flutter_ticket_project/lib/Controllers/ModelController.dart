import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_ticket_project/Models/EventModel.dart';

class EventController {
  static Future<List<EventModel>> getEvents() async {
    try {
      final jsonString = await rootBundle.loadString('Assets/data.json');
      final eventsJson = json.decode(jsonString);

      return eventsJson
          .map<EventModel>((eventJson) => EventModel.fromJson(eventJson))
          .toList();
    } catch (e) {
      throw Exception('Error loading data: $e');
    }
  }
}
