import 'package:flutter/material.dart';

import '../custom_text_button.dart';
import 'category_card.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              'Categories',
                       style: Theme.of(context).textTheme.headlineMedium,

            ),
            CustomTextButton(text: "See All"),
          ],
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CategoryCard(icon: Icons.plumbing, label: 'Plumbing'),
            CategoryCard(icon: Icons.power_outlined, label: 'Electrical'),
            CategoryCard(icon: Icons.ac_unit, label: 'AC Repair'),
            CategoryCard(
              icon: Icons.cleaning_services_outlined,
              label: 'Cleaning',
            ),
          ],
        ),
      ],
    );
  }
}
