import 'package:flutter/material.dart';

import '../../models/service_model.dart';

class CartItemCard extends StatelessWidget {
  final ServiceModel item;
  final VoidCallback onModify;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onModify,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xffBDC9C9)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.image!,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    height: 140,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.image,
                      color: Colors.grey,
                      size: 40,
                    ),
                  ),
            ),
          ),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.name!,
                  style: const TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '\$${item.price}',
                style: const TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.person_outline, size: 16, color: Colors.grey.shade600),
              const SizedBox(width: 4),
              Text(
                item.provider!.name!,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontSize: 14),
              ),
            ],
          ),

          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 15,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 4),
              Text(
                "Today, 18:00",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontSize: 14),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.location_on_outlined,
                size: 16,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 2),
              Text(
                "Damascus",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontSize: 14),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onModify,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: primaryColor, width: 1.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: Text(
                    'Modify',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextButton(
                  onPressed: onRemove,
                  child: const Text(
                    'Remove',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFDC2626),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
