import 'package:flutter/material.dart';

import '../../models/booking_confirmation_model.dart';

class BookingDetailsCard extends StatelessWidget {
  final BookingConfirmationModel bookingData;

  const BookingDetailsCard({super.key, required this.bookingData});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xffBDC9C9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'BOOKING REF',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                bookingData.bookingRef,
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Divider(color: Colors.grey.shade300, height: 1),

          const SizedBox(height: 24),

          _buildDetailItem(label: 'SERVICE', value: bookingData.serviceTitle),

          const SizedBox(height: 24),

          _buildDetailItem(
            label: 'PROFESSIONAL',
            child: Row(
              children: [
                Icon(Icons.person_outline, size: 18, color: primaryColor),
                const SizedBox(width: 6),
                Text(
                  bookingData.professionalName,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          _buildDetailItem(label: 'DATE & TIME', value: bookingData.dateTime),

          const SizedBox(height: 24),

          _buildDetailItem(label: 'ADDRESS', value: bookingData.address),
        ],
      ),
    );
  }

  Widget _buildDetailItem({
    required String label,
    String? value,
    Widget? child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 4),
        if (child != null)
          child
        else
          Text(
            value ?? '',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0F172A),
            ),
          ),
      ],
    );
  }
}
