import 'package:flutter/material.dart';
import 'package:flutter_ticket_project/Models/TicketModel.dart';
import 'package:flutter_ticket_project/Views/BottomNavBarView.dart';
import 'package:flutter_ticket_project/Views/PaymentView.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketInfoView extends StatelessWidget {
  final TicketModel ticket;
  const TicketInfoView({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment Successfull!")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Your Ticket Infos:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const seperator(),
          Center(
            child: QrImageView(
                size: 240,
                data:
                    "Event Name: ${ticket.event.eventName} , Seats: ${ticket.seatNums.toString()} "),
          ),
          const seperator(),
          CustomInfoItem(info: "Event Name:", desc: ticket.event.eventName),
          CustomInfoItem(
              info: "Event location:", desc: ticket.event.eventLocationName),
          CustomInfoItem(info: "Event Time:", desc: ticket.event.eventTime),
          CustomInfoItem(
              info: "Event Start Date:",
              desc:
                  "${ticket.event.startDay}/${ticket.event.startMonth}/${ticket.event.startYear}"),
          CustomInfoItem(
              info: "Event Finish Date:",
              desc:
                  "${ticket.event.finishDay}/${ticket.event.finishMonth}/${ticket.event.finishYear}"),
          CustomInfoItem(info: "Seats:", desc: ticket.seatNums.toString()),
          const CustomMainPageButton(
              text: "Go to Main Page", view: BottomNavigationBarExample())
        ]),
      ),
    );
  }
}

class CustomInfoItem extends StatelessWidget {
  const CustomInfoItem({
    super.key,
    required this.info,
    required this.desc,
  });

  final String info;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          info,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          desc,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

class CustomMainPageButton extends StatelessWidget {
  final String text;
  final Widget view;

  const CustomMainPageButton({
    super.key,
    required this.text,
    required this.view,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => view),
                )
              },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
