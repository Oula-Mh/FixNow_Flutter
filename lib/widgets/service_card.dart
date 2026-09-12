import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/service_model.dart';
import '../provider/favorites_provider.dart';
import 'favorite_button_positioned.dart';

class ServiceCard extends ConsumerWidget {
  final ServiceModel service;
  final VoidCallback? onBookTap;

  const ServiceCard({
    super.key,
    required this.service,
    this.onBookTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    ref.watch(favoritesProvider);

    final isFav = ref.read(favoritesProvider.notifier).isFavorite(service.id!);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffBDC9C9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
               service.image!,
                  height: 192,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 192,
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Icon(
                      Icons.image,
                      color: Colors.grey,
                      size: 40,
                    ),
                  ),
                ),
              ),
              FavoriteButtonPositioned(
                  onTap: () {
                  ref.read(favoritesProvider.notifier).toggleFavorite(service);
                  },
                  isFavorite: isFav,
                ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        service.name!,
                        style: const TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star_rounded, size: 18, color: primaryColor),
                        const SizedBox(width: 4),
                        Text(
                          "${service.rating}",
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                if (service.description != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    service.description!,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.3,
                    ),
                  ),
                ],

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${service.price ?? 0}",
                      style: const TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 38,
                      width: 100,
                      child: FilledButton(
                        onPressed: onBookTap,
                        child: const Text(
                          'Book',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  
}