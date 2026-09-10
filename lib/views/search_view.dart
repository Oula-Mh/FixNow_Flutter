import 'package:flutter/material.dart';

import '../models/service_model.dart';
import '../widgets/widget_search/search_app_bar.dart';
import '../widgets/service_card.dart';
import 'booking_confirmation_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final services = ServiceModel.dummyServices;

    return Scaffold(
      appBar: SearchAppBar(
        controller: _searchController,
        onChanged: (query) {

        },
      ),
//       body: ListView.separated(
//         padding: const EdgeInsets.all(16.0),
//         itemCount: services.length,
//         separatorBuilder: (context, index) => const SizedBox(height: 16),
//         itemBuilder: (context, index) {
//           final service = services[index];
//           return ServiceCard(
//             service: service,
//             onBookTap: () {
//  Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const BookingConfirmationView()),
//         );
//             },
//             onFavoriteToggle: (isFav) {

//             },
//           );
//         },
//       ),
    );
  }
}
