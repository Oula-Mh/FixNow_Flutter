import 'package:flutter/material.dart';

class CustomConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;

  const CustomConfirmDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,

   
  });

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      content: Text(
        content,
        style: const TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: const TextStyle(
              fontFamily: 'Inter',
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        FilledButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
        
          child: Text(
            'Confirm',
            style: const TextStyle(
              fontFamily: 'Inter',
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}