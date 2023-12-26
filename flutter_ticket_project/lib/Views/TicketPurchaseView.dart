import 'package:flutter/material.dart';
import 'package:flutter_ticket_project/Models/EventModel.dart';
import 'package:flutter_ticket_project/Views/EventDetailsView.dart';
import 'package:flutter_ticket_project/Views/PaymentView.dart';
import 'package:flutter_ticket_project/Views/SeatSelectionView.dart';

class TicketPurchaseView extends StatelessWidget {
  final EventModel event;

  const TicketPurchaseView({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    List<String> seats = [];
    return Scaffold(
      appBar: AppBar(title: const Text("Ticket")),
      body: ListView(children: [
        EventInfoWidget(event: event),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Select Seat",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        SeatSelectionView(
          secilenler: seats,
        ),
        //Sahne
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(border: Border.all()),
          width: double.infinity,
          height: 14,
          child: const Center(
              child: Text(
            "Sahne",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
          )),
        ),
        const SizedBox(
          height: 16,
        ),
        //Button
        CustomTicketPurchaseButton(
          event: event,
          icon: Icons.airplane_ticket,
          text: "Ödemeye Geç",
          view: PaymentView(
            selectedSeats: seats,
            event: event,
          ),
        ),
      ]),
    );
  }
}

class EventInfoWidget extends StatelessWidget {
  const EventInfoWidget({
    super.key,
    required this.event,
  });

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)),
            child: Image(
              height: 300,
              width: double.infinity,
              image: AssetImage(event.eventPhoto),
              fit: BoxFit.cover,
            )),
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.99),
                Colors.transparent,
                Colors.black.withOpacity(0.99),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          top: 12,
          left: 8,
          child: Text(
            event.eventName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Tarihler
                Row(
                  children: [
                    //Start Date
                    Row(
                      children: [
                        //Start Day
                        Text(
                          event.startDay,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight: FontWeight.w900),
                        ),
                        //Start Ay ve yıl
                        Container(
                          margin: const EdgeInsets.all(4),
                          child: Column(
                            children: [
                              Text(
                                event.startMonth,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              Text(event.startYear,
                                  style: const TextStyle(color: Colors.grey))
                            ],
                          ),
                        ),
                      ],
                    ),
                    //Çizgi
                    const Text(
                      "-",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),

                    //finish Date
                    Row(
                      children: [
                        //Finish Day
                        Text(
                          event.finishDay,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight: FontWeight.w900),
                        ),
                        //Finish ay ve yıl
                        Container(
                          margin: const EdgeInsets.all(4),
                          child: Column(
                            children: [
                              Text(
                                event.finishMonth,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              Text(event.finishYear,
                                  style: const TextStyle(color: Colors.grey))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  width: 30,
                ),

                //Saat Tür Location
                Positioned(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //Saat ve Tür
                      Row(
                        children: [
                          Text(
                            event.eventTime,
                            style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          const SizedBox(width: 12),
                          Text(event.eventType,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.white)),
                        ],
                      ),

                      //Konum
                      Row(
                        children: [
                          const Icon(
                            Icons.location_pin,
                            size: 18,
                            color: Colors.white,
                          ),
                          Text(event.eventLocationName,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
