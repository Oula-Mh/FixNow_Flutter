import 'package:flutter/material.dart';

class OrderSummaryCard extends StatelessWidget {
  final int itemCount;
  final double subtotal;
  final double serviceFee;
  final double tax;
  final VoidCallback onCheckout;

  const OrderSummaryCard({
    super.key,
    required this.itemCount,
    required this.subtotal,
    required this.serviceFee,
    required this.tax,
    required this.onCheckout,
  });

  double get total {
    return subtotal + serviceFee + tax;
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xffBDC9C9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          _buildSummaryRow(
            label: 'Subtotal ($itemCount items)',
            value: '\$$subtotal',
          ),
          const SizedBox(height: 10),

          _buildSummaryRow(label: 'Service Fee', value: '\$$serviceFee'),
          const SizedBox(height: 10),

          _buildSummaryRow(label: 'Tax', value: '\$$tax'),
          const SizedBox(height: 16),

          Divider(color: Colors.grey.shade300, height: 1),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$$total',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton(
              onPressed: onCheckout,

              child: const Text(
                'Proceed to Checkout',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow({required String label, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
                    ),
        ),
      ],
    );
  }
}
