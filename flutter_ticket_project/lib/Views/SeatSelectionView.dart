import 'package:flutter/material.dart';

class SeatSelectionView extends StatefulWidget {
  final List<String> secilenler;

  const SeatSelectionView({super.key, required this.secilenler});

  @override
  State<SeatSelectionView> createState() => _SeatSelectionViewState();
}

class _SeatSelectionViewState extends State<SeatSelectionView> {
  List<String> selectedSeats = [];
  List<String> alreadySelectedSeats = [];
  @override
  Widget build(BuildContext context) {
    return buildSeatContainer();
  }

  Widget buildSeatContainer() {
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      height: 260,
      decoration: const BoxDecoration(),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
          crossAxisSpacing: 4.0, // Sütunlar arasındaki boşluk
          mainAxisSpacing: 4.0, // Satırlar arasındaki boşluk
        ),
        itemCount: 40,
        itemBuilder: (context, index) {
          String seatNum = "${index + 1}";
          Color seatColor = Colors.grey;

          if (selectedSeats.contains(seatNum)) {
            seatColor = Colors.blue;
          } else if (seatNum.startsWith("2")) {
            seatColor = Colors.red;
            alreadySelectedSeats.add(seatNum);
          }

          return GestureDetector(
            onTap: () {
              setState(() {
                if ((!selectedSeats.contains(seatNum)) &&
                    !(alreadySelectedSeats.contains(seatNum))) {
                  widget.secilenler.add(seatNum);
                  selectedSeats.add(seatNum);
                } else if (selectedSeats.contains(seatNum)) {
                  selectedSeats.remove(seatNum);
                  widget.secilenler.remove(seatNum);
                }
              });
            },
            child: CustomSeat(
              seatNum: seatNum,
              seatColor: seatColor,
            ),
          );
        },
      ),
    );
  }
}

class CustomSeat extends StatelessWidget {
  final String seatNum;
  final Color seatColor;

  const CustomSeat({Key? key, required this.seatNum, required this.seatColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.event_seat_rounded,
          color: seatColor,
          size: 42,
        ),
        Positioned(
            left: 16,
            top: 4,
            child: Text(
              seatNum,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            )),
      ],
    );
  }
}
