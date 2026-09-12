import 'package:flutter/material.dart';

class FavoriteButtonPositioned extends StatelessWidget {
  final VoidCallback onTap;
  final bool isFavorite;

  const FavoriteButtonPositioned({
    super.key,
    required this.onTap,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Positioned(
      top: 12,
      right: 12,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,

            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : primaryColor,
            size: 22,
          ),
        ),
      ),
    );
  }
}
