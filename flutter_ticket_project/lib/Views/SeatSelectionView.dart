import 'package:flutter/material.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({super.key});

  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  List<String> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seat Selection"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildSeatContainer(4),
          const SizedBox(width: 16),
          buildSeatContainer(8),
          const SizedBox(width: 16),
          buildSeatContainer(4),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectedSeatsScreen(selectedSeats),
            ),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }

  Widget buildSeatContainer(int columnCount) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          String seatNum = "$columnCount-${index + 1}";
          Color seatColor = Colors.grey;

          if (selectedSeats.contains(seatNum)) {
            seatColor = Colors.blue;
          } else if (seatNum.startsWith("4")) {
            seatColor = Colors.red;
          }

          return GestureDetector(
            onTap: () {
              setState(() {
                if (selectedSeats.contains(seatNum)) {
                  selectedSeats.remove(seatNum);
                } else {
                  selectedSeats.add(seatNum);
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
        Positioned(left: 17, top: 4, child: Text(seatNum)),
      ],
    );
  }
}

class SelectedSeatsScreen extends StatelessWidget {
  final List<String> selectedSeats;

  const SelectedSeatsScreen(this.selectedSeats, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selected Seats"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Selected Seats:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(selectedSeats.join(", ")),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SeatSelectionScreen(),
  ));
}
