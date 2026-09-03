import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  const CustomTextButton({required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.headlineLarge?.copyWith(fontSize: 14, color: primaryColor),
      ),
    );
  }
}
