import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/service_model.dart';
import '../provider/search_providers.dart';
import '../provider/services_provider.dart';
import '../widgets/service_card.dart';
import '../widgets/widget_search/search_app_bar.dart';
import 'booking_confirmation_view.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final servicesAsync = ref.watch(servicesProvider);

    final List<ServiceModel> searchedServices = ref.watch(searchResultProvider);

    return Scaffold(
      appBar: SearchAppBar(
        controller: _searchController,
        onChanged: (query) {
          ref.read(searchQueryProvider.notifier).updateQuery(query);
        },
      ),
      body: servicesAsync.when(
        data: (_) {
          if (searchedServices.isEmpty) {
            return const Center(
              child: Text(
                'No services found',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16.0),
            itemCount: searchedServices.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final service = searchedServices[index];
              return ServiceCard(
                service: service,
                onBookTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BookingConfirmationView(),
                    ),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}

