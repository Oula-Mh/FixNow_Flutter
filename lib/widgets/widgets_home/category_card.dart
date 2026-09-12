import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  const CategoryCard({required this.icon , required this.label,super.key});

  @override
  Widget build(BuildContext context) {
        final primaryColor = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300, width: 0.8),
          ),
          child: Icon(icon, color:primaryColor, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
         style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14),

        ),
      ],
    );
  }
}
