import 'package:flutter/material.dart';

import '../custom_text_button.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Row(
      children: [
        Icon(Icons.location_on_outlined, color: primaryColor, size: 22),
        const SizedBox(width: 6),
         Text(
          'Damascus, Syria',
          style: Theme.of(context).textTheme.bodyLarge
        ),
        const Spacer(),
        CustomTextButton(text: "Change"),
      ],
    );
  }
}
