class ServiceModel {
  final String imagePath;
  final String title;
  final String rating;
  final String price;

  const ServiceModel({
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.price,
  });

  static const List<ServiceModel> dummyServices = [
    ServiceModel(
      imagePath: 'assets/images/onboarding3.png',
      title: 'AC Maintenance',
      rating: '4.8 (120+)',
      price: '\$45',
    ),
    ServiceModel(
      imagePath: 'assets/images/onboarding1.png',
      title: 'Deep Cleaning',
      rating: '4.9 (200+)',
      price: '\$30',
    ),
  ];
}