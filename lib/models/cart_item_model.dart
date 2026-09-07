class CartItemModel {
  final String id;
  final String imagePath;
  final String title;
  final String providerName;
  final String dateTime;
  final String location;
  final double price;

  const CartItemModel({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.providerName,
    required this.dateTime,
    required this.location,
    required this.price,
  });

  static const List<CartItemModel> dummyCartItems = [
    CartItemModel(
      id: '1',
      imagePath: 'assets/images/ac_maintenance.png',
      title: 'AC Maintenance',
      providerName: 'Ahmad Maintenance',
      dateTime: 'Today, 18:00',
      location: 'Damascus',
      price: 25.0,
    ),
    CartItemModel(
      id: '2',
      imagePath: 'assets/images/pipe_leak.png',
      title: 'Pipe Leak Repair',
      providerName: 'City Plumbers',
      dateTime: 'Tomorrow, 10:00',
      location: 'Damascus',
      price: 45.0,
    ),
  ];
}