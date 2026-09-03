import 'package:flutter/material.dart';

class SearchTriggerCard extends StatelessWidget {
  final String hintText;
  final VoidCallback onTap;

  const SearchTriggerCard({
    super.key,
    required this.hintText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300, width: 1.2),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.grey.shade500,
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(
              hintText,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 15,
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}