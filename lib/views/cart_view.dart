import 'package:flutter/material.dart';

import '../models/cart_item_model.dart';
import '../widgets/custom_main_app_bar.dart';
import '../widgets/widgets_cart/order_summary_card.dart';


class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<CartItemModel> cartItems = List.from(CartItemModel.dummyCartItems);

  double get subtotal =>
      cartItems.fold(0, (sum, item) => sum + item.price);

  final double serviceFee = 5.0;
  final double tax = 3.50;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: const CustomMainAppBar(),
      body: SingleChildScrollView(
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

            // ListView.separated(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: cartItems.length,
            //   separatorBuilder: (context, index) => const SizedBox(height: 16),
            //   itemBuilder: (context, index) {
            //     final item = cartItems[index];
            //     return CartItemCard(
            //       item: item,
            //       onModify: () {
            //       },
            //       onRemove: () {
            //         setState(() {
            //           cartItems.removeAt(index);
            //         });
            //       },
            //     );
            //   },
            // ),

            const SizedBox(height: 20),

            if (cartItems.isNotEmpty)
              OrderSummaryCard(
                itemCount: cartItems.length,
                subtotal: subtotal,
                serviceFee: serviceFee,
                tax: tax,
                onCheckout: () {
                },
              ),
          ],
        ),
      ),
    );
  }
}