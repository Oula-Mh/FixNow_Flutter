import 'package:flutter/material.dart';

import '../models/service_model.dart';
import '../widgets/widget_service_details/about_service_section.dart';
import '../widgets/widget_service_details/provider_card.dart';
import '../widgets/widget_service_details/service_bottom_bar.dart';
import '../widgets/widget_service_details/service_details_app_bar.dart';
import '../widgets/widget_service_details/service_main_card.dart';
import '../widgets/widget_service_details/whats_included_section.dart';

class ServiceDetailsView extends StatelessWidget {
 final ServiceModel serviceModel;
   const ServiceDetailsView({ required this.serviceModel,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ServiceDetailsAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ServiceMainCard(service: serviceModel),
            const SizedBox(height: 32),
             AboutServiceSection(description: serviceModel.description!,),
            const SizedBox(height: 24),
             WhatsIncludedSection(items:serviceModel.includes!,),
            const SizedBox(height: 16),
            const Text(
              'Select a Provider',
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
             ProviderCard(serviceProvider: serviceModel.provider!,),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar:  ServiceBottomBar(price: serviceModel.price!,),
    );
  }
}
