class SeatWidget {
  final int seatNumber;
  final bool isReserved;
  final bool isSelected;
  final Function(bool) onSelected;

  SeatWidget({
    required this.seatNumber,
    required this.isReserved,
    required this.isSelected,
    required this.onSelected,
  });
}
