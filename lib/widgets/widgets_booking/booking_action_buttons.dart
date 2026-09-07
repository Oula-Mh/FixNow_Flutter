import 'package:flutter/material.dart';

class BookingActionButtons extends StatelessWidget {
  final VoidCallback onViewBooking;
  final VoidCallback onBackToHome;

  const BookingActionButtons({
    super.key,
    required this.onViewBooking,
    required this.onBackToHome,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56,
          child: FilledButton(
            onPressed: onViewBooking,
            child: const Text(
              'View Booking',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Back to Home Button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: OutlinedButton(
            onPressed: onBackToHome,
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: primaryColor, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Back to Home',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
