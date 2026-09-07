class BookingConfirmationModel {
  final String bookingRef;
  final String serviceTitle;
  final String professionalName;
  final String dateTime;
  final String address;

  const BookingConfirmationModel({
    required this.bookingRef,
    required this.serviceTitle,
    required this.professionalName,
    required this.dateTime,
    required this.address,
  });

  static const BookingConfirmationModel dummyData = BookingConfirmationModel(
    bookingRef: '#FXN-8472',
    serviceTitle: 'Emergency Plumbing',
    professionalName: 'Michael R.',
    dateTime: 'Oct 24, 2023 at 2:00 PM',
    address: '123 Main St, Apt 4B',
  );
}