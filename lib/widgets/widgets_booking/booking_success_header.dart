import 'package:flutter/material.dart';

class BookingSuccessHeader extends StatelessWidget {
  const BookingSuccessHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: const BoxDecoration(
            color: Color(0xFFE6F4F1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),

        const Text(
          'Service Booked',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),

        Text(
          'Your professional has been\nconfirmed.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            color: Colors.grey.shade600,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}