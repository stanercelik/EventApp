// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ticket_project/Models/EventModel.dart';

class EventView extends StatelessWidget {
  final EventModel event;

  const EventView({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(1, 2),
              )
            ]),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image(
                  height: 200,
                  width: 400,
                  image: AssetImage(event.eventPhoto),
                  fit: BoxFit.cover,
                )),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    event.eventName,
                    style: TextStyles.eventNameTextStyle,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        event.eventType,
                        style: TextStyles.eventInfoTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_pin,
                  size: 18,
                ),
                Text(
                  event.eventLocationName,
                  style: TextStyles.locationTextStyle,
                ),
              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    DateWidget(
                      day: event.startDay,
                      month: event.startMonth,
                      year: event.startYear,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "-",
                        style: TextStyles.lineTextStyle,
                      ),
                    ),
                    DateWidget(
                      day: event.finishDay,
                      month: event.finishMonth,
                      year: event.finishYear,
                    ),
                  ],
                ),
                SizedBox(
                  width: 42,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: SizedBox(
                    height: 32,
                    width: 1,
                  ),
                ),
                SizedBox(
                  width: 42,
                ),
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: Column(
                    children: [
                      Text("Saat",
                          style: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w300)),
                      Text(
                        event.eventTime,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}

class DateWidget extends StatelessWidget {
  final String day;
  final String month;
  final String year;

  const DateWidget(
      {super.key, required this.day, required this.month, required this.year});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          day,
          style: TextStyles.bigDateTextStyle,
        ),
        Container(
          margin: const EdgeInsets.all(4),
          child: Column(
            children: [
              Text(
                month,
                style: const TextStyle(color: Colors.grey),
              ),
              Text(year, style: const TextStyle(color: Colors.grey))
            ],
          ),
        ),
      ],
    );
  }
}

class TextStyles {
  static const TextStyle eventNameTextStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black);

  static const TextStyle eventInfoTextStyle =
      TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800);

  static TextStyle locationTextStyle =
      TextStyle(fontWeight: FontWeight.w100, color: Colors.grey[800]);

  static const TextStyle lineTextStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  static const TextStyle bigDateTextStyle =
      TextStyle(color: Colors.black, fontSize: 42, fontWeight: FontWeight.w900);
}
