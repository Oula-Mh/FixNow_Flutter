import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const SearchAppBar({
    super.key,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      // leading: IconButton(
      //   icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
      //   onPressed: () => Navigator.of(context).pop(),
      // ),
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: SizedBox(
          height: 48,
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            autofocus: true,
            style:  TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              hintText: 'Search services or professionals ...',
              hintStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: Colors.grey.shade400,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: primaryColor,
                size: 22,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: primaryColor, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: primaryColor, width: 1.5),
              ),
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}


