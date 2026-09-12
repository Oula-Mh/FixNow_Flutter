import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/service_model.dart';
import '../../provider/favorites_provider.dart';
import '../favorite_button_positioned.dart';

class PopularServiceCard extends ConsumerWidget {
  final ServiceModel service;
  final VoidCallback? onTap;

  const PopularServiceCard({super.key, required this.service, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(favoritesProvider);

    final isFav = ref.read(favoritesProvider.notifier).isFavorite(service.id!);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 240,
        height: 312,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300, width: 0.8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.network(
                    service.image!,
                    height: 178,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          height: 178,
                          width: double.infinity,
                          color: Theme.of(context).colorScheme.secondary,
                          child: const Icon(Icons.image, color: Colors.grey),
                        ),
                  ),
                ),

                FavoriteButtonPositioned(
                  onTap: () {
                    ref
                        .read(favoritesProvider.notifier)
                        .toggleFavorite(service);
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
                  Text(
                    service.name!,
                    style: const TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Theme.of(context).colorScheme.primary,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${service.rating ?? 0}",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${service.price ?? 0}",
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        TextSpan(
                          text: '/hr',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
