import 'package:flutter/material.dart';
import 'package:flutter_ticket_project/Controllers/ModelController.dart';
import 'package:flutter_ticket_project/Models/EventModel.dart';
import 'package:flutter_ticket_project/Utils/EventView.dart';
import 'package:flutter_ticket_project/Views/EventDetailsView.dart';

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  late Future<List<EventModel>> _events; // Doğrudan başlatma

  @override
  void initState() {
    super.initState();
    _events = EventController.getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventModel>>(
      future: _events,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EventDetailsView(event: snapshot.data![index]),
                    ),
                  );
                },
                child: EventView(event: snapshot.data![index]),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
