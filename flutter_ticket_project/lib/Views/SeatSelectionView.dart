import 'package:flutter/material.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({super.key});

  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  List<bool> selectedSeats = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koltuk Seçme Ekranı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                5,
                (index) => SeatWidget(
                  seatNumber: index + 1,
                  isReserved: index % 2 ==
                      0, // Örnek olarak her iki koltuğu da rezerve ettim
                  isSelected: selectedSeats[index],
                  onSelected: (isSelected) {
                    setState(() {
                      selectedSeats[index] = isSelected;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Seçilen koltukları kontrol edin ve satın alma ekranına yönlendirin
                List<int> selectedSeatNumbers = [];
                for (int i = 0; i < selectedSeats.length; i++) {
                  if (selectedSeats[i]) {
                    selectedSeatNumbers.add(i + 1);
                  }
                }

                if (selectedSeatNumbers.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PurchaseScreen(selectedSeatNumbers),
                    ),
                  );
                } else {
                  // Kullanıcıya bir uyarı verilebilir.
                  print('Lütfen bir koltuk seçin.');
                }
              },
              child: const Text('Satın Al'),
            ),
            GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(10, (index) {
                return Center(
                    child: CustomSeat(
                  seatNum: "$index",
                ));
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSeat extends StatelessWidget {
  final String seatNum;
  const CustomSeat({super.key, required this.seatNum});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(
          Icons.event_seat_rounded,
          color: Colors.amber,
          size: 42,
        ),
        Positioned(left: 17, top: 4, child: Text(seatNum)),
      ],
    );
  }
}

class SeatWidget extends StatelessWidget {
  final int seatNumber;
  final bool isReserved;
  final bool isSelected;
  final Function(bool) onSelected;

  const SeatWidget({
    super.key,
    required this.seatNumber,
    required this.isReserved,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    Color seatColor = isReserved
        ? Colors.red
        : isSelected
            ? Colors.blue
            : Colors.green;

    return GestureDetector(
      onTap: () {
        if (!isReserved) {
          onSelected(!isSelected);
        }
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: seatColor,
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            '$seatNumber',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class PurchaseScreen extends StatelessWidget {
  final List<int> selectedSeatNumbers;

  const PurchaseScreen(this.selectedSeatNumbers, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Satın Alma Ekranı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Satın Alınan Koltuklar: ${selectedSeatNumbers.join(', ')}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Satın alma işlemini tamamlayın veya başka bir işlem yapın
                // Örneğin, ödeme sayfasına yönlendirilebilirsiniz.
              },
              child: const Text('Ödeme Sayfasına Git'),
            ),
          ],
        ),
      ),
    );
  }
}
