import 'package:flutter/material.dart';

import '../widgets/widget_service_details/about_service_section.dart';
import '../widgets/widget_service_details/provider_card.dart';
import '../widgets/widget_service_details/service_bottom_bar.dart';
import '../widgets/widget_service_details/service_details_app_bar.dart';
import '../widgets/widget_service_details/service_main_card.dart';
import '../widgets/widget_service_details/whats_included_section.dart';

class ServiceDetailsView extends StatelessWidget {
  const ServiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ServiceDetailsAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ServiceMainCard(),
            SizedBox(height: 32),
            AboutServiceSection(),
            SizedBox(height: 24),
            WhatsIncludedSection(),
            SizedBox(height: 16),
            Text(
              'Select a Provider',
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ProviderCard(),
            SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: ServiceBottomBar(),
    );
  }
}
