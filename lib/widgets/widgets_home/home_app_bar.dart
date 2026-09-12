import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/theme_provider.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final themeMode = ref.watch(themeNotifierProvider);
    final isDark = themeMode == ThemeMode.dark;

    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 20,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'FixNow',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              Text(
                'Good morning, Alex',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            ref.read(themeNotifierProvider.notifier).toggleTheme();
          },
          icon: Icon(
            isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            size: 24,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_outlined,
              size: 26,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(height: 1, thickness: 1, color: Color(0xffBDC9C9)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}