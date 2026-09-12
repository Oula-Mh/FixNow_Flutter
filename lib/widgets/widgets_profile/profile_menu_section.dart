import 'package:flutter/material.dart';

class ProfileMenuItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}

class ProfileMenuSection extends StatelessWidget {
  final String sectionTitle;
  final List<ProfileMenuItem> items;

  const ProfileMenuSection({
    super.key,
    required this.sectionTitle,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xffBDC9C9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sectionTitle,
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 8),

          Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
          const SizedBox(height: 16),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(item.icon, color: Colors.grey.shade700, size: 22),
                title: Text(
                  item.title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.grey.shade400,
                ),
                onTap: item.onTap,
              );
            },
          ),
        ],
      ),
    );
  }
}
