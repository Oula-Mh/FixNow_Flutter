import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/service_model.dart';
import '../../provider/cart_provider.dart';



class ServiceBottomBar extends ConsumerWidget {
  final ServiceModel service;

  const ServiceBottomBar({required this.service, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    ref.watch(cartProvider);

    final cartNotifier = ref.read(cartProvider.notifier);
    final isInCart =cartNotifier.isInCart(service.id!);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Estimated',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$${service.price }',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            FilledButton(
              onPressed: isInCart
                  ? null
                  : () {
                      cartNotifier.addToCart(service);
                    },
              style: FilledButton.styleFrom(
                disabledBackgroundColor: Colors.grey.shade300,
              ),
              child: Text(
                isInCart ? 'Added to Cart' : 'Add to Cart',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: isInCart ? Colors.grey.shade600 : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}