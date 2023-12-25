import 'package:flutter/material.dart';
import 'package:flutter_ticket_project/Models/EventModel.dart';
import 'package:flutter_ticket_project/Views/TicketPurchaseView.dart';

class EventDetailsView extends StatelessWidget {
  final EventModel event;

  const EventDetailsView({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const BackButton(
              color: Colors.white, // Geri tuşunun rengini belirle
            ),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
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
                          Colors.transparent,
                          Colors.black.withOpacity(0.99),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 24,
                    left: 8,
                    child: Text(
                      event.eventName.length > 28
                          ? "${event.eventName.substring(0, 25)}..."
                          : event.eventName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 24,
                      right: 8,
                      child: Text(
                        "₺${event.price.toString()}",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ))
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  event.startDay,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 42,
                                      fontWeight: FontWeight.w900),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(4),
                                  child: Column(
                                    children: [
                                      Text(
                                        event.startMonth,
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      Text(event.startYear,
                                          style: const TextStyle(
                                              color: Colors.grey))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Text(
                                  event.finishDay,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 42,
                                      fontWeight: FontWeight.w900),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(4),
                                  child: Column(
                                    children: [
                                      Text(
                                        event.finishMonth,
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      Text(event.finishYear,
                                          style: const TextStyle(
                                              color: Colors.grey))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  event.eventTime,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                ),
                                const SizedBox(width: 12),
                                Text(event.eventType,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16)),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_pin,
                                  size: 18,
                                ),
                                Text(event.eventLocationName,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey[600])),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    const Text("Description",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16)),
                    const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dolor magna, molestie imperdiet leo et, congue suscipit nunc. Quisque malesuada augue dignissim, egestas velit ultrices, scelerisque lorem. Quisque ullamcorper mauris est. Nulla mauris sapien, vulputate eget nibh sit amet, consequat lacinia magna. Etiam semper pretium rhoncus. Vestibulum condimentum enim ac lobortis ultricies. Vivamus at est vestibulum, lobortis neque in, efficitur ipsum. Duis vel purus scelerisque, aliquet libero eu, eleifend nunc. Suspendisse potenti. Nam fermentum libero ac metus lacinia interdum. Fusce pretium nibh non tristique tempor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce sit amet magna enim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin non sapien ultrices, porttitor sapien malesuada, sollicitudin purus. Praesent pulvinar ex purus, vel tempor erat laoreet aliquam. Integer a egestas justo. Nulla dapibus mi in nisl egestas faucibus. Donec consequat elit leo, in interdum erat dignissim interdum. Curabitur ultricies, turpis et molestie posuere, risus augue ullamcorper est, sed tempus nibh urna a velit. Vestibulum eu lorem ac magna dapibus pharetra. Nam eu imperdiet justo, quis consequat dolor. Vestibulum mattis velit eu ultricies scelerisque. Donec est lectus, faucibus et malesuada ultrices, pharetra et velit. Integer volutpat velit non ex aliquam convallis. Morbi id fringilla est, vel gravida mi."),
                    CustomTicketPurchaseButton(
                      event: event,
                      icon: Icons.shopping_cart,
                      text: "Satın Al",
                      view: TicketPurchaseView(
                        event: event,
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class CustomTicketPurchaseButton extends StatelessWidget {
  final EventModel event;
  final IconData icon;
  final String text;
  final Widget view;

  const CustomTicketPurchaseButton(
      {super.key,
      required this.event,
      required this.icon,
      required this.text,
      required this.view});

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
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(32))),
          child: Center(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
