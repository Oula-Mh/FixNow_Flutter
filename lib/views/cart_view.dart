import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/cart_provider.dart';
import '../widgets/custom_confirm_dialog.dart';
import '../widgets/custom_main_app_bar.dart';
import '../widgets/widgets_cart/cart_item_card.dart';
import '../widgets/widgets_cart/order_summary_card.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  final double serviceFee = 5.0;
  final double tax = 3.50;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final cartAsync = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);

    return Scaffold(
      appBar: const CustomMainAppBar(),
      body: cartAsync.when(
        data: (cartItems) {
          if (cartItems.isEmpty) {
            return const Center(
              child: Text(
                'Not found cart',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            );
          }

          final subtotal = cartNotifier.subtotal;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Cart',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 16),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cartItems.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return CartItemCard(
                      item: item,
                      onModify: () {},
                      onRemove: () {
                        showDialog(
                          context: context,
                          builder:
                              (context) => CustomConfirmDialog(
                                title: 'Remove Item',
                                content:
                                    'Are you sure you want to remove "${item.name}" from your cart?',
                                onConfirm: () {
                                  cartNotifier.removeFromCart(item.id!);
                                },
                              ),
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 20),

                OrderSummaryCard(
                  itemCount: cartItems.length,
                  subtotal: subtotal,
                  serviceFee: serviceFee,
                  tax: tax,
                  onCheckout: () {},
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (err, stack) =>
                Center(child: Text('Error: exsit error .. try again')),
      ),
    );
  }
}
