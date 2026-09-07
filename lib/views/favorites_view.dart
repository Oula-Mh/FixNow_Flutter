import 'package:flutter/material.dart';

import '../models/service_model.dart';
import '../widgets/custom_main_app_bar.dart';
import '../widgets/service_card.dart';
import 'booking_confirmation_view.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final List<ServiceModel> favoriteServices = const [
    ServiceModel(
      imagePath: 'assets/images/onboarding1.png',
      title: 'Deep Cleaning',
      rating: '4.9',
      price: '\$150',
      description:
          'Comprehensive home deep cleaning service including all rooms and appliances.',
    ),
    ServiceModel(
      imagePath: 'assets/images/electrical.png',
      title: 'Electrical Repair',
      rating: '4.8',
      price: '\$85/hr',
      description:
          'Licensed electricians for panel upgrades, rewiring, and fault fixing.',
    ),
    ServiceModel(
      imagePath: 'assets/images/plumbing.png',
      title: 'Plumbing Fix',
      rating: '4.7',
      price: '\$90/hr',
      description:
          'Emergency leak repairs, pipe installations, and general plumbing diagnostics.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: const CustomMainAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Favorites',
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 16),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: favoriteServices.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final service = favoriteServices[index];
                return ServiceCard(
                  service: service,
                  onBookTap: () {
 Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BookingConfirmationView()),
        );
                  },
                  onFavoriteToggle: (isFav) {

                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}