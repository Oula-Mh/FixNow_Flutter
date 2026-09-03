import 'package:flutter/material.dart';

import '../widgets/widgets_home/categories_section.dart';
import '../widgets/widgets_home/home_app_bar.dart';
import '../widgets/widgets_home/location.dart';
import '../widgets/widgets_home/need_help_card.dart';
import '../widgets/widgets_home/popular_services_section.dart';
import '../widgets/widgets_home/search_trigger_card.dart';
import 'search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          children: [
            Location(),

            const SizedBox(height: 16),

            SearchTriggerCard(
              hintText: 'What service do you need?',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchView()),
                );
              },
            ),
            const SizedBox(height: 24),

            NeedHelpCard(),

            const SizedBox(height: 28),

            CategoriesSection(),

            const SizedBox(height: 28),

            PopularServicesSection(),
          ],
        ),
      ),
    );
  }
}
