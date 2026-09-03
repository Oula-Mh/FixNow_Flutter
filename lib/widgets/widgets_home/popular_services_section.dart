import 'package:flutter/material.dart';
import '../../models/service_model.dart';
import '../../views/service_details_view.dart';
import 'service_card.dart';

class PopularServicesSection extends StatelessWidget {
  const PopularServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Services',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 312,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: ServiceModel.dummyServices.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final service = ServiceModel.dummyServices[index];
              return ServiceCard(service: service,onTap: (){
                Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ServiceDetailsView()),
        );
              },);
            },
          ),
        ),
      ],
    );
  }
}
