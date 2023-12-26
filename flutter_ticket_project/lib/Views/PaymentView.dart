import 'package:flutter/material.dart';
import 'package:flutter_ticket_project/Models/EventModel.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_ticket_project/Models/TicketModel.dart';
import 'package:flutter_ticket_project/Views/TicketInfoView.dart';
import 'package:flutter_ticket_project/Views/TicketPurchaseView.dart';

class PaymentView extends StatelessWidget {
  final List<String> selectedSeats;
  final EventModel event;

  const PaymentView({
    super.key,
    required this.selectedSeats,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    //String qrData = "Event: ${event.eventName}, Seats: $selectedSeats, Ticket Owner: $customerNameSurname";
    TicketModel ticket = TicketModel(
      event: event,
      seatNums: selectedSeats,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Details"),
      ),
      body: ListView(
        children: [
          EventInfoWidget(
            event: event,
          ),
          const seperator(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Event Name: ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(event.eventName),
                  ],
                ),
                const seperator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Selected Seats:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      selectedSeats.join(", "),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Ticket Count:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${selectedSeats.length} x ₺${event.price}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Price:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₺${selectedSeats.length * event.price}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const seperator(),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(24))),
                  child: CreditCardForm(
                    formKey: GlobalKey<FormState>(), // Required
                    cardNumber: "", // Required
                    expiryDate: "", // Required
                    cardHolderName: "", // Required
                    cvvCode: "", // Required
                    onCreditCardModelChange:
                        (CreditCardModel data) {}, // Required
                    obscureCvv: true,
                    obscureNumber: true,
                    isHolderNameVisible: true,
                    isCardNumberVisible: true,
                    isExpiryDateVisible: true,
                    enableCvv: true,
                    cvvValidationMessage: 'Please input a valid CVV',
                    dateValidationMessage: 'Please input a valid date',
                    numberValidationMessage: 'Please input a valid number',
                    cardNumberValidator: (String? cardNumber) {
                      return null;
                    },
                    expiryDateValidator: (String? expiryDate) {
                      return null;
                    },
                    cvvValidator: (String? cvv) {
                      return null;
                    },
                    cardHolderValidator: (String? cardHolderName) {
                      return null;
                    },
                    onFormComplete: () {
                      // callback to execute at the end of filling card data
                    },
                    autovalidateMode: AutovalidateMode.always,
                    disableCardNumberAutoFillHints: false,
                    inputConfiguration: const InputConfiguration(
                      cardNumberDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                      ),
                      expiryDateDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card Holder',
                      ),
                      cardNumberTextStyle: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                      cardHolderTextStyle: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                      expiryDateTextStyle: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                      cvvCodeTextStyle: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const seperator(),
                CustomPayButton(
                    event: event,
                    text: "Pay Now!",
                    view: TicketInfoView(
                      ticket: ticket,
                    ),
                    ticket: ticket)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class seperator extends StatelessWidget {
  const seperator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
    );
  }
}

class CustomPayButton extends StatelessWidget {
  final EventModel event;
  final TicketModel ticket;
  final String text;
  final Widget view;

  const CustomPayButton(
      {super.key,
      required this.event,
      required this.text,
      required this.view,
      required this.ticket});

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
            child: const Text(
              "Pay Now!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
