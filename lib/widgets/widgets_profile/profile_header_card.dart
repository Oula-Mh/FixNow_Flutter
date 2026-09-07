import 'package:flutter/material.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xffBDC9C9)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: primaryColor, width: 2),
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
          ),
          const SizedBox(height: 12),

          Text(
            "Alex",
            style: const TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 4),

          Text(
            "alex@example.com",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 16),

          SizedBox(
            height: 36,
            child: FilledButton(
              onPressed: () {},

              child: const Text(
                'Edit Profile',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
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
}
