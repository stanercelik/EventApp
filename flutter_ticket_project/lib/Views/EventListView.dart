import 'package:flutter/material.dart';
import 'package:flutter_ticket_project/Models/EventModel.dart';
import 'package:flutter_ticket_project/Utils/EventView.dart';
import 'package:flutter_ticket_project/Views/EventDetailsView.dart';

class EventList extends StatelessWidget {
  final List<EventModel> events = [
    EventModel(
      eventPhoto: "Assets/Images/bea.jpg",
      eventName: "Flutter Workshop 1",
      eventLocationName: "ABC Konferans Salonu",
      startDay: "15",
      startMonth: "May",
      startYear: "2023",
      finishDay: "17",
      finishMonth: "May",
      finishYear: "2023",
      eventTime: "14:00",
      eventType: "Workshop",
    ),
    EventModel(
      eventPhoto: "Assets/Images/bea.jpg",
      eventName: "Flutter Workshop 2",
      eventLocationName: "XYZ Toplantı Salonu",
      startDay: "20",
      startMonth: "June",
      startYear: "2023",
      finishDay: "22",
      finishMonth: "June",
      finishYear: "2023",
      eventTime: "10:00",
      eventType: "Seminar",
    ),
    EventModel(
      eventPhoto: "Assets/Images/bea.jpg",
      eventName: "Büyük Ev Ablukada",
      eventLocationName: "Hangout PSM",
      startDay: "20",
      startMonth: "Ara",
      startYear: "2023",
      finishDay: "21",
      finishMonth: "Ara",
      finishYear: "2023",
      eventTime: "20:00",
      eventType: "Konser",
    ),
    EventModel(
      eventPhoto: "Assets/Images/eab_christmas.jpg",
      eventName: "Eats And Beats Christmas Bazaar",
      eventLocationName: "Hilltown Alışveriş Merkezi",
      startDay: "20",
      startMonth: "Ara",
      startYear: "2023",
      finishDay: "24",
      finishMonth: "Ara",
      finishYear: "2023",
      eventTime: "20:00",
      eventType: "Festival",
    )
  ];

  EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EventDetailsView(event: events[index]),
              ),
            );
          },
          child: EventView(event: events[index]),
        );
      },
    );
  }
}
